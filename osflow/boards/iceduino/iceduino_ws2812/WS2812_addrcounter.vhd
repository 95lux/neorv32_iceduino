library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity WS2812_addrcounter is
    Port (
        clk    : in  STD_LOGIC;
        acnt_rst    : in  STD_LOGIC;
        acnt_inc    : in  STD_LOGIC;

        acnt_eq191  : out std_logic;
        address     : out std_ulogic_vector(7 downto 0)

    );
end WS2812_addrcounter;

architecture Behavioral of WS2812_addrcounter is
    signal cnt: std_logic_vector(7 downto 0) := (others => '0');  -- Internal counter signal
begin
    process(clk)
    begin
        
        if rising_edge(clk) then
            if acnt_inc = '1' then
                cnt <= cnt + 1;
            end if;
            if acnt_rst = '1' then
                cnt <= (others => '0');    
        
            end if;
        end if;
    end process;

    acnt_eq191 <= '1' when cnt = 191 else '0';
    address <= std_ulogic_vector(cnt);
end Behavioral;
