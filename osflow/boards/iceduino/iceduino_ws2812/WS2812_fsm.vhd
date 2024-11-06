library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WS2812_fsm is
    Port (
        clk             : in  std_logic;
        start_send      : in  std_logic;
        aserial_run     : in  std_logic;
        acnt_eq191      : in  std_logic;
        sfr_done        : in  std_logic;
        
        acnt_rst        : out  std_logic;
        acnt_inc        : out  std_logic;
        sfr_rst         : out  std_logic;
        sfr_shift       : out  std_logic;
        sfr_load        : out  std_logic;
        aserial_wnr     : out  std_logic
    );
end WS2812_fsm;

architecture Behavioral of WS2812_fsm is
    -- Signals
    type state_type is (IDLE, GET_ADDR, SHIFT, WAIT_ASERIAL_RUN, WAIT_ASERIAL_RUN_N, CHECK_ADDR, INC_ADDR, RESET);
    signal state : state_type := IDLE;

    signal reset_cnt : integer := 0;
    signal reset_cnt_run: std_logic := '0';

    constant max_reset_cnt : integer := 6000;
    -- constant max_reset_cnt : integer := 2500;

begin
    process (clk) is
    begin
        if rising_edge(clk) then
            case state is
                when IDLE =>
                    acnt_rst <= '1';
                    sfr_rst <= '1';

                    reset_cnt_run <= '0';
                    reset_cnt <= 0;

                    if start_send = '1' then
                        state <= GET_ADDR;
                    end if;

                when GET_ADDR =>
                    sfr_load <= '1';
                    aserial_wnr <= '1';

                    acnt_rst <= '0';
                    sfr_rst <= '0';
                    acnt_inc <= '0';

                    -- if aserial_run = '1' then
                    state <= SHIFT;
                    -- end if;

                when SHIFT =>
                    sfr_load <= '0';

                    sfr_shift <= '1';

                    state <= WAIT_ASERIAL_RUN;

                when WAIT_ASERIAL_RUN =>
                    sfr_shift <= '0';

                    if aserial_run = '1' then
                        state <= WAIT_ASERIAL_RUN_N;
                    end if;

                when WAIT_ASERIAL_RUN_N =>

                    if aserial_run = '0' then
                        state <= SHIFT;
                    end if;
                    -- if bit transmission is complete, and the shift register is empty
                    if aserial_run = '0' and sfr_done = '1' then
                        state <= CHECK_ADDR;
                    end if;

                when CHECK_ADDR => 
                    if acnt_eq191 = '1' then
                        state <= RESET;
                    else
                        state <= INC_ADDR;
                    end if;
                
                when INC_ADDR =>
                    acnt_inc <= '1';
                    state <= GET_ADDR;

                when RESET =>
                    acnt_rst <= '1';
                    sfr_rst <= '1';
                    aserial_wnr <= '0';
                    acnt_inc <= '0';

                    reset_cnt_run <= '1';

                    if reset_cnt >= max_reset_cnt then
                        state <= IDLE;
                    end if;

            end case;

            -- Manage reset counter
            if reset_cnt_run = '1' then
                reset_cnt <= reset_cnt + 1;
            else
                reset_cnt <= 0;
            end if;

        end if;
    end process;

end Behavioral;
