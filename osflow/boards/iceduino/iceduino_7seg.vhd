library ieee;
use ieee.std_logic_1164.all;

entity iceduino_7seg is
    generic (
        led_addr : std_ulogic_vector(31 downto 0)
    );
    port (
        clk_i  : in std_ulogic; -- global clock line
        rstn_i : in std_ulogic; -- global reset line, low-active
        --wishbone-
        adr_i : in std_ulogic_vector(31 downto 0);
        dat_i : in std_ulogic_vector(31 downto 0); --write to slave
        dat_o : out std_ulogic_vector(31 downto 0);
        we_i  : in std_ulogic;
        stb_i : in std_ulogic;
        cyc_i : in std_ulogic;
        ack_o : out std_ulogic;
        err_o : out std_ulogic;
        -- parallel io --
        segdisp_o : out std_ulogic_vector(6 downto 0)
    );
end entity;

architecture iceduino_7seg_rtl of iceduino_7seg is

    signal module_active : std_ulogic;
    signal module_addr : std_ulogic_vector(31 downto 0);
    signal reg_7seg : std_ulogic_vector(6 downto 0);

begin
    -- module active
    module_active <= '1' when ((adr_i = led_addr) and (cyc_i = '1' and stb_i = '1')) else
        '0';
    module_addr <= adr_i;

    w_access : process (clk_i)
    begin
        if rising_edge(clk_i) then
            -- handshake
            err_o <= '0';
            if (module_active = '1') then
                ack_o <= '1';
            else
                ack_o <= '0';
            end if;
            --write  
            if (module_active = '1' and we_i = '1') then
            reg_7seg <= "0111111" when dat_i(3 downto 0) = "0000" else -- 0       
                        "0000110" when dat_i(3 downto 0) = "0001" else -- 1
                        "1011011" when dat_i(3 downto 0) = "0010" else -- 2
                        "1001111" when dat_i(3 downto 0) = "0011" else -- 3
                        "1100110" when dat_i(3 downto 0) = "0100" else -- 4
                        "1101101" when dat_i(3 downto 0) = "0101" else -- 5
                        "1111101" when dat_i(3 downto 0) = "0110" else -- 6
                        "0000111" when dat_i(3 downto 0) = "0111" else -- 7
                        "1111111" when dat_i(3 downto 0) = "1000" else -- 8
                        "1101111" when dat_i(3 downto 0) = "1001" else -- 9
                        "1011111" when dat_i(3 downto 0) = "1010" else -- A
                        "1111100" when dat_i(3 downto 0) = "1011" else -- b
                        "1011000" when dat_i(3 downto 0) = "1100" else -- C
                        "1011110" when dat_i(3 downto 0) = "1101" else -- d
                        "1111001" when dat_i(3 downto 0) = "1110" else -- E
                        "1110001" when dat_i(3 downto 0) = "1111" else -- F
                        "0000000"; -- fallback         
            end if;
            --read
            dat_o(31 downto 0) <= (others => '0');
            if (module_active = '1' and we_i = '0') then
                dat_o(6 downto 0) <= reg_7seg;
            end if;
        end if;
    end process w_access;

    -- output
    segdisp_o <= reg_7seg;

end architecture;