library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity program_memory is 
	port (
			clk : in std_logic;
			adress : in std_logic_vector(7 downto 0);
			data_out : out std_logic_vector(7 downto 0)
	);
end entity;



architecture arch of program_memory is

constant YUKLE_A_SBT : std_logic_vector(7 downto 0) := x"86";
constant YUKLE_A : std_logic_vector(7 downto 0) := x"87";
constant YUKLE_B_SBT : std_logic_vector(7 downto 0) := x"88";
constant YUKLE_B : std_logic_vector(7 downto 0) := x"89";
constant KAYDET_A : std_logic_vector(7 downto 0) := x"96";
constant KAYDET_B : std_logic_vector(7 downto 0) := x"97";

constant TOPLA_AB : std_logic_vector(7 downto 0) := x"42";
constant CIKAR_AB : std_logic_vector(7 downto 0) := x"43";
constant AND_AB : std_logic_vector(7 downto 0) := x"44";
constant OR_AB : std_logic_vector(7 downto 0) := x"45";
constant ARTIR_A : std_logic_vector(7 downto 0) := x"46";
constant ARTIR_B : std_logic_vector(7 downto 0) := x"47";
constant DUSUR_A : std_logic_vector(7 downto 0) := x"48";
constant DUSUR_B : std_logic_vector(7 downto 0) := x"49";

constant ATLA : std_logic_vector(7 downto 0) := x"20";
constant ATLA_NEGATIFSE : std_logic_vector(7 downto 0) := x"21";
constant ATLA_POZITIFSE : std_logic_vector(7 downto 0) := x"22";
constant ATLA_ESITSE_SIFIR : std_logic_vector(7 downto 0) := x"23";
constant ATLA_DEGILSE_SIFIR : std_logic_vector(7 downto 0) := x"24";
constant ATLA_OVERFLOW_VARSA : std_logic_vector(7 downto 0) := x"25";
constant ATLA_OVERFLOW_YOKSA : std_logic_vector(7 downto 0) := x"26";
constant ATLA_ELDE_VARSA : std_logic_vector(7 downto 0) := x"27";
constant ATLA_ELDE_YOKSA : std_logic_vector(7 downto 0) := x"28";


type rom_type is array (0 to 127) of std_logic_vector(7 downto 0);
	constant ROM : rom_type := (	
                                	0	=> YUKLE_A_SBT,
									1	=> x"0F",
									2	=> YUKLE_B_SBT,
									3	=> x"41",
									4	=> TOPLA_AB,
									5	=> KAYDET_A,
									6   => x"80",
									7   => ATLA,
									8   => x"00",									
									others 	=> x"00"
								);
								
							


signal enable : std_logic;
begin 

process(adress)
begin
	if(adress >= x"00" and adress <= x"7F") then
	enable <= '1';
	else 
	enable <= '0';
	end if ;
end process;

process(clk)
begin 
	if(rising_edge(clk)) then 
		if(enable = '1') then
			data_out <= ROM(to_integer (unsigned (adress)));
		end if;
	end if;
end process;

end architecture;

