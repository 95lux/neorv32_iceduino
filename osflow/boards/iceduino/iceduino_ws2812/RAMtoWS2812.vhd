library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- für die Konvertierungsfunktionen

library iceduino;

entity RAMtoWS2812 is
    Port(
        clk         : in std_logic;
        din         : in std_logic_vector(7 downto 0);
        addr        : out std_logic_vector(7 downto 0);
        ws2812_out  : out std_logic
    );
end RAMtoWS2812;

architecture bhv of RAMtoWS2812 is
    signal start_send  :  std_logic := '1';

    signal s_aserial_reset      : std_logic := '0';
    signal s_aserial_wnr        : std_logic := '0';
    signal s_aserial_data_in    : std_logic;
    signal s_aserial_run        : std_logic;

    signal s_acnt_rst           : std_logic;
    signal s_acnt_inc           : std_logic;
    signal s_acnt_eq191         : std_logic;

    signal s_sfr_rst            : std_logic;
    signal s_sfr_shift          : std_logic;
    signal s_sfr_load           : std_logic;
    signal s_sfr_done           : std_logic;

    begin

        fsm : entity iceduino.WS2812_fsm
        port map (
            clk          => clk,   
            start_send   => start_send,
            aserial_run  => s_aserial_run,
            acnt_eq191   => s_acnt_eq191,
            sfr_done     => s_sfr_done,
            acnt_rst     => s_acnt_rst,    
            acnt_inc     => s_acnt_inc,  
            sfr_rst      => s_sfr_rst, 
            sfr_shift    => s_sfr_shift, 
            sfr_load     => s_sfr_load,
            aserial_wnr  => s_aserial_wnr
        );
        
        aserial : entity iceduino.WS2812_aserial
        port map (
            clk         => clk,
            reset       => s_aserial_reset,
            wnr         => s_aserial_wnr,
            data_in     => s_aserial_data_in,
            ws2812_out  => ws2812_out,
            run         => s_aserial_run
        );

        addrcounter : entity iceduino.WS2812_addrcounter
        port map (
            clk         => clk,
            acnt_rst    => s_acnt_rst,
            acnt_inc    => s_acnt_inc,
            acnt_eq191  => s_acnt_eq191,
            address     => addr
        );

        shiftregister : entity iceduino.WS2812_shiftregister
        port map (
            clk         => clk,
            sfr_din     => din,
            sfr_rst     => s_sfr_rst,
            sfr_shift   => s_sfr_shift,
            sfr_load    => s_sfr_load,
            sfr_done    => s_sfr_done,
            sfr_serout  => s_aserial_data_in      
        );
end bhv;