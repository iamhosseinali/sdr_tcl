-- Generated by sine_wave_generator.c
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sine_Wave_Gen is
Port (
    M_AXIS_ACLK    : in STD_LOGIC; --- This should be 100000000 Hz
    M_AXIS_ARESETN : in STD_LOGIC;   --- negative asynch reset
    M_AXIS_tDATA   : out std_logic_vector(63 downto 0); --- ACTUAL_OUTPUT_SIGNAL_FREQUENCY : 12025 Hz
    M_AXIS_tVALID  : out std_logic
);
end Sine_Wave_Gen;

architecture Behavioral of Sine_Wave_Gen is

constant SIN_TABLE_Length          : integer := 126;
constant SIN_DATA_WIDTH            : integer := 12;
type SIN_TABLEType is array(0 to SIN_TABLE_Length-1) of integer;
constant SIN_TABLE : SIN_TABLEType :=(0,102,203,305,405,505,603,700,795,888,979,1067,1153,1236,1316,1392,1466,1535,1601,1662,1720,1773,1822,1866,1906,1941,1971,1996,2016,2032,2042,2047,2047,2042,2032,2016,1996,1971,1941,1906,1866,1822,1773,1720,1662,1601,1535,1466,1392,1316,1236,1153,1067,979,888,795,700,603,505,405,305,203,102,0,-102,-203,-305,-405,-505,-603,-700,-795,-888,-979,-1067,-1153,-1236,-1316,-1392,-1466,-1535,-1601,-1662,-1720,-1773,-1822,-1866,-1906,-1941,-1971,-1996,-2016,-2032,-2042,-2047,-2047,-2042,-2032,-2016,-1996,-1971,-1941,-1906,-1866,-1822,-1773,-1720,-1662,-1601,-1535,-1466,-1392,-1316,-1236,-1153,-1067,-979,-888,-795,-700,-603,-505,-405,-305,-203,-102);
signal indx_cycle                  : integer := 65;
signal sin_indx                    : unsigned(6 downto 0) := (others=>'0');
signal cnt                         : unsigned(31 downto 0) := (others=>'0');

begin
process(M_AXIS_ACLK)
begin
    if rising_edge(M_AXIS_ACLK) then
       if (M_AXIS_ARESETN='0') then    --- Asynch reset
           cnt             <= (others=>'0');
           sin_indx        <= (others=>'0');
           M_AXIS_tVALID   <= '0';
       else
           cnt             <= cnt+1;
           M_AXIS_tVALID   <= '0';
           if(cnt=indx_cycle)then
               cnt        <= (others=>'0');
               sin_indx   <= sin_indx+1;
               if(sin_indx=SIN_TABLE_Length-1) then
                   sin_indx       <= (others=>'0');
               end if;
               M_AXIS_tVALID  <= '1';
               M_AXIS_tDATA   <=  std_logic_vector(to_signed(SIN_TABLE(to_integer(sin_indx)),SIN_DATA_WIDTH)) & "0000" & std_logic_vector(to_signed(SIN_TABLE(to_integer(sin_indx)),SIN_DATA_WIDTH)) & "0000";
           end if;
       end if;
    end if;
end process;
end Behavioral;