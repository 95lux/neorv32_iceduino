library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity iceduino_ws2812_dpram_converter is
    port (
        clk_i  : in std_ulogic; -- global clock line
        rstn_i : in std_ulogic; -- global reset line, low-active
        --used wishbone ports from toplevel-
        adr_i : in std_ulogic_vector(31 downto 0);
        dat_i : in std_ulogic_vector(31 downto 0); --write to slave
        dat_o : out std_ulogic_vector(31 downto 0);
        we_i  : in std_ulogic;
        module_active : in std_ulogic;
        -- parallel io --
        dat_dp_o : out std_ulogic_vector(7 downto 0);
        addr_dp_o : out std_ulogic_vector(7 downto 0);
        we_dp_o : out std_ulogic
    );
end entity;

architecture iceduino_ws2812_dpram_converter_rtl of iceduino_ws2812_dpram_converter is

    -- signal module_active : std_ulogic;
    -- signal module_addr : std_ulogic_vector(31 downto 0);
    signal reg_dpram_buf : std_ulogic_vector(31 downto 0);
    signal reg_dpram_addr_buf : std_ulogic_vector(31 downto 0);

    -- byte counter;
    -- subtype Byte_Count is integer range 0 to 3;
    -- signal byte_cnt : Byte_Count := 0;
    signal byte_cnt : natural := 0;
    constant byte_multiplier : natural := 3;
    signal byte_cnt_inc : std_logic := '0';
    signal byte_cnt_reset : std_logic := '0';

    -- fsm
    type state_type is (IDLE, CONVERTING, BLUE, GREEN, RED, WRITING);
    signal state : state_type := IDLE;

begin


    w_access : process (clk_i)
    begin
        if rising_edge(clk_i) then
            -- write buffer register
            if (module_active = '1' and we_i = '1') then
                reg_dpram_buf <= dat_i; 
                reg_dpram_addr_buf <= adr_i;
            end if;

            --read buffer register
            dat_o(31 downto 0) <= (others => '0');
            -- output
            if (module_active = '1' and we_i = '0') then
                dat_o(31 downto 0) <= reg_dpram_buf;
            end if;
        end if;
    end process w_access;

    fsm: process(clk_i)
    begin
        if rising_edge(clk_i) then

            if (module_active = '1') then
                case state is
                    when IDLE => 
                        we_dp_o <= '0';
                        byte_cnt_inc <= '0';

                        if we_i = '1' then
                            state <= CONVERTING;
                        end if;

                    when CONVERTING => 
                        byte_cnt_reset <= '0';
                        byte_cnt_inc <= '1';
                        we_dp_o <= '0';

                        -- calculate address of 8Bit address space
                        addr_dp_o <= std_ulogic_vector( unsigned("00" & adr_i(7 downto 2)) + 
                                                        unsigned("00" & adr_i(7 downto 2)) + 
                                                        unsigned("00" & adr_i(7 downto 2)) + 
                                                        byte_cnt);
                        
                        if byte_cnt = 0 then
                            state <= BLUE;
                        end if;
                        if byte_cnt = 1 then
                            state <= GREEN;
                        end if;
                        if byte_cnt = 2 then
                            state <= RED;
                        end if;

                    when BLUE => 
                        dat_dp_o <= reg_dpram_buf(7 downto 0);

                        we_dp_o <= '1';
                        byte_cnt_inc <= '0';

                        state <= WRITING;

                    when GREEN => 
                        dat_dp_o <= reg_dpram_buf(15 downto 8);

                        we_dp_o <= '1';
                        byte_cnt_inc <= '0';

                        state <= WRITING;

                    when RED => 
                        dat_dp_o <= reg_dpram_buf(23 downto 16);

                        we_dp_o <= '1';
                        byte_cnt_inc <= '0';
                        byte_cnt_reset <= '1';

                        state <= WRITING;
                    
                    when WRITING => 

                        if byte_cnt < 2 then
                            state <= CONVERTING;
                        else
                            state <= IDLE;
                        end if;
                    when others => 
                        state <= IDLE;
                        
                end case;
            end if;
        end if;
    end process;

    counter: process(clk_i)
    begin
        if rising_edge(clk_i) then
            if module_active = '1' then
                -- Manage reset counter
                if byte_cnt_reset = '1' then
                    byte_cnt <= 0;
                elsif byte_cnt_inc = '1' then
                    byte_cnt <= byte_cnt + 1;
                end if;
            end if;
        end if;
    end process;

end architecture;