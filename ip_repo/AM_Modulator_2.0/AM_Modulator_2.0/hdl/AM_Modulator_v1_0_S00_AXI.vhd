--- Egineer : Hosseinali
--- Company : TAKSUN

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AM_Modulator_v1_0_S00_AXI is
	generic (
		-- Users to add parameters here
		S_AXIS_ACLK_FRQ			: integer := 100000000;
		CARRIER_FRQ				: integer := 100000;
		BYPASS_MODULATION		: boolean := false;
		MAX_CARRIER_FRQ         : boolean := false;
		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here
		--- S_AXI stream ports --- 
        i_Tx_1_tVALID    : in std_logic;
        i_Tx_1_tDATA     : in std_logic_vector(11 downto 0);
        i_Tx_1_tRAEDY    : out std_logic;
        q_Tx_1_tVALID    : in std_logic;
        q_Tx_1_tDATA     : in std_logic_vector(11 downto 0);
        q_Tx_1_tRAEDY    : out std_logic;
        
		i_Tx_2_tVALID    : in std_logic;
        i_Tx_2_tDATA     : in std_logic_vector(11 downto 0);
        i_Tx_2_tRAEDY    : out std_logic;
		q_Tx_2_tVALID    : in std_logic;
        q_Tx_2_tDATA     : in std_logic_vector(11 downto 0);
        q_Tx_2_tRAEDY    : out std_logic;
        
		S_AXIS_ACLK    : in std_logic;
		--- M_AXI stream ports --- 
        M_AXIS_tVALID    : out std_logic;
        M_AXIS_tDATA     : out std_logic_vector(63 downto 0);
        M_AXIS_tRAEDY    : in std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global Clock Signal
		S_AXI_ACLK	: in std_logic;
		-- Global Reset Signal. This Signal is Active LOW
		S_AXI_ARESETN	: in std_logic;
		-- Write address (issued by master, acceped by Slave)
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Write channel Protection type. This signal indicates the
    		-- privilege and security level of the transaction, and whether
    		-- the transaction is a data access or an instruction access.
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		-- Write address valid. This signal indicates that the master signaling
    		-- valid write address and control information.
		S_AXI_AWVALID	: in std_logic;
		-- Write address ready. This signal indicates that the slave is ready
    		-- to accept an address and associated control signals.
		S_AXI_AWREADY	: out std_logic;
		-- Write data (issued by master, acceped by Slave) 
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Write strobes. This signal indicates which byte lanes hold
    		-- valid data. There is one write strobe bit for each eight
    		-- bits of the write data bus.    
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		-- Write valid. This signal indicates that valid write
    		-- data and strobes are available.
		S_AXI_WVALID	: in std_logic;
		-- Write ready. This signal indicates that the slave
    		-- can accept the write data.
		S_AXI_WREADY	: out std_logic;
		-- Write response. This signal indicates the status
    		-- of the write transaction.
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		-- Write response valid. This signal indicates that the channel
    		-- is signaling a valid write response.
		S_AXI_BVALID	: out std_logic;
		-- Response ready. This signal indicates that the master
    		-- can accept a write response.
		S_AXI_BREADY	: in std_logic;
		-- Read address (issued by master, acceped by Slave)
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Protection type. This signal indicates the privilege
    		-- and security level of the transaction, and whether the
    		-- transaction is a data access or an instruction access.
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		-- Read address valid. This signal indicates that the channel
    		-- is signaling valid read address and control information.
		S_AXI_ARVALID	: in std_logic;
		-- Read address ready. This signal indicates that the slave is
    		-- ready to accept an address and associated control signals.
		S_AXI_ARREADY	: out std_logic;
		-- Read data (issued by slave)
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Read response. This signal indicates the status of the
    		-- read transfer.
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		-- Read valid. This signal indicates that the channel is
    		-- signaling the required read data.
		S_AXI_RVALID	: out std_logic;
		-- Read ready. This signal indicates that the master can
    		-- accept the read data and response information.
		S_AXI_RREADY	: in std_logic
	);
end AM_Modulator_v1_0_S00_AXI;

architecture arch_imp of AM_Modulator_v1_0_S00_AXI is

	-- AXI4LITE signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	: std_logic;
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rvalid	: std_logic;

	-- Example-specific design signals
	-- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	-- ADDR_LSB is used for addressing 32/64 bit registers/memories
	-- ADDR_LSB = 2 for 32 bits (n downto 2)
	-- ADDR_LSB = 3 for 64 bits (n downto 3)
	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	constant OPT_MEM_ADDR_BITS : integer := 1;
	------------------------------------------------
	---- Signals for user logic register space example
	signal Tx_1_tRAEDY_int			: std_logic := '0';
	signal Tx_2_tRAEDY_int			: std_logic := '0';
    signal slv_reg0_0,slv_reg0_1	: std_logic := '0'; 
    attribute ASYNC_REG : string;
    attribute ASYNC_REG of slv_reg0_0,slv_reg0_1 : signal is "TRUE";
------------------------------------------------------------------------------
------------------- this section is generated via a .c app -------------------
------------------------------------------------------------------------------
constant SIN_TABLE_Length          : integer := 128;
constant SIN_DATA_WIDTH            : integer := 11;
type SIN_TABLEType is array(0 to SIN_TABLE_Length-1) of integer;
constant SIN_TABLE : SIN_TABLEType :=(0,50,100,150,199,248,297,344,391,437,482,526,568,609,649,687,724,758,791,822,851,878,903,925,946,964,979,993,1004,
1012,1019,1022,1023,1022,1019,1012,1004,993,979,964,946,925,903,878,851,822,791,758,724,687,649,609,568,526,482,437,391,344,297,248,199,150,100,50,0,-50,
-100,-150,-199,-248,-297,-344,-391,-437,-482,-526,-568,-609,-649,-687,-724,-758,-791,-822,-851,-878,-903,-925,-946,-964,-979,-993,-1004,-1012,-1019,-1022,
-1023,-1022,-1019,-1012,-1004,-993,-979,-964,-946,-925,-903,-878,-851,-822,-791,-758,-724,-687,-649,-609,-568,-526,-482,-437,-391,-344,-297,-248,-199,-150,-100,-50);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
	signal clk_cnt		: unsigned(15 downto 0) := (others=>'0');
	signal sin_indx		: unsigned(6 downto 0) := (others=>'0');
	signal sin_data		: signed(SIN_DATA_WIDTH-1 downto 0) := (others=>'0');


	constant constant1	           : signed (14 downto 0) := to_signed(7,15); --- 0.00045 (s,0,14)
	constant constant2	           : signed (15 downto 0) := to_signed(16384,16); ---'1'	(s,1,14)
	signal 	 product		       : signed (26 downto 0) := (others => '0'); -- (s,12,14)
	signal 	 product1	           : signed (26 downto 0) := (others => '0'); -- (s,12,14)
	signal 	 sum			       : signed (15 downto 0) := (others => '0'); -- (s,1,14)

	signal   Tx_1_tDATA_buff       : std_logic_vector(11 downto 0) := (others => '0');
	signal indx_cycle			   : integer := (S_AXIS_ACLK_FRQ/CARRIER_FRQ)/SIN_TABLE_Length; --- one cycle of the carrier sin has SIN_TABLE_Length samples
	
	--------------------------------------------------
	---- Number of Slave Registers 4
	signal slv_reg0	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg1	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg2	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg3	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg_rden	: std_logic;
	signal slv_reg_wren	: std_logic;
	signal reg_data_out	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal byte_index	: integer;
	signal aw_en	: std_logic;

begin
indx_cycle  <= 0 when MAX_CARRIER_FRQ=true;

	-- I/O Connections assignments

	S_AXI_AWREADY	<= axi_awready;
	S_AXI_WREADY	<= axi_wready;
	S_AXI_BRESP	<= axi_bresp;
	S_AXI_BVALID	<= axi_bvalid;
	S_AXI_ARREADY	<= axi_arready;
	S_AXI_RDATA	<= axi_rdata;
	S_AXI_RRESP	<= axi_rresp;
	S_AXI_RVALID	<= axi_rvalid;
	-- Implement axi_awready generation
	-- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	-- de-asserted when reset is low.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awready <= '0';
	      aw_en <= '1';
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions. 
	           axi_awready <= '1';
	           aw_en <= '0';
	        elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then
	           aw_en <= '1';
	           axi_awready <= '0';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_awaddr latching
	-- This process is used to latch the address when both 
	-- S_AXI_AWVALID and S_AXI_WVALID are valid. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
	        -- Write Address latching
	        axi_awaddr <= S_AXI_AWADDR;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_wready generation
	-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1' and aw_en = '1') then
	          -- slave is ready to accept write data when 
	          -- there is a valid write address and write data
	          -- on the write address and data bus. This design 
	          -- expects no outstanding transactions.           
	          axi_wready <= '1';
	      else
	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;
	end process; 

	-- Implement memory mapped register select and write logic generation
	-- The write data is accepted and written to memory mapped registers when
	-- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	-- select byte enables of slave registers while writing.
	-- These registers are cleared when reset (active low) is applied.
	-- Slave register write enable is asserted when valid address and data are available
	-- and the slave is ready to accept the write address and write data.
	slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

	process (S_AXI_ACLK)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      slv_reg0 <= (others => '0');
	      slv_reg1 <= (others => '0');
	      slv_reg2 <= (others => '0');
	      slv_reg3 <= (others => '0');
	    else
	      loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	      if (slv_reg_wren = '1') then
	        case loc_addr is
	          when b"00" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 0
	                slv_reg0(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 1
	                slv_reg1(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"10" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 2
	                slv_reg2(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 3
	                slv_reg3(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when others =>
	            slv_reg0 <= slv_reg0;
	            slv_reg1 <= slv_reg1;
	            slv_reg2 <= slv_reg2;
	            slv_reg3 <= slv_reg3;
	        end case;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	-- This marks the acceptance of address and indicates the status of 
	-- write transaction.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arready generation
	-- axi_arready is asserted for one S_AXI_ACLK clock cycle when
	-- S_AXI_ARVALID is asserted. axi_awready is 
	-- de-asserted when reset (active low) is asserted. 
	-- The read address is also latched when S_AXI_ARVALID is 
	-- asserted. axi_araddr is reset to zero on reset assertion.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_arready <= '0';
	      axi_araddr  <= (others => '1');
	    else
	      if (axi_arready = '0' and S_AXI_ARVALID = '1') then
	        -- indicates that the slave has acceped the valid read address
	        axi_arready <= '1';
	        -- Read Address latching 
	        axi_araddr  <= S_AXI_ARADDR;           
	      else
	        axi_arready <= '0';
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arvalid generation
	-- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	-- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	-- data are available on the axi_rdata bus at this instance. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
	-- cleared to zero on reset (active low).  
	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then
	    if S_AXI_ARESETN = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;            
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
	slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid) ;

	process (slv_reg0, slv_reg1, slv_reg2, slv_reg3, axi_araddr, S_AXI_ARESETN, slv_reg_rden)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	    case loc_addr is
	      when b"00" =>
	        reg_data_out <= slv_reg0;
	      when b"01" =>
	        reg_data_out <= slv_reg1;
	      when b"10" =>
	        reg_data_out <= slv_reg2;
	      when b"11" =>
	        reg_data_out <= slv_reg3;
	      when others =>
	        reg_data_out  <= (others => '0');
	    end case;
	end process; 

	-- Output register or memory read data
	process( S_AXI_ACLK ) is
	begin
	  if (rising_edge (S_AXI_ACLK)) then
	    if ( S_AXI_ARESETN = '0' ) then
	      axi_rdata  <= (others => '0');
	    else
	      if (slv_reg_rden = '1') then
	        -- When there is a valid read address (S_AXI_ARVALID) with 
	        -- acceptance of read address by the slave (axi_arready), 
	        -- output the read dada 
	        -- Read address mux
	          axi_rdata <= reg_data_out;     -- register read data
	      end if;   
	    end if;
	  end if;
	end process;


	-- Add user logic here
	---- when BYPASS_MODULATION=true Tx_1 and Tx_2 will be on the output when slv_reg0(0) = 1
	---- when BYPASS_MODULATION=false the modulated signal of the Tx_1 will be on the output and Tx_2 input will be ignored.
    double_reg_for_synchro : process(S_AXIS_ACLK)
    begin
        if rising_edge(S_AXIS_ACLK) then 
            slv_reg0_0	<= slv_reg0(0);
            slv_reg0_1	<= slv_reg0_0;
        end if;
    end process;
	BYPASS : if(BYPASS_MODULATION=true) generate	
		M_AXIS_tVALID		          <= (i_Tx_1_tVALID or q_Tx_1_tVALID or i_Tx_2_tVALID or q_Tx_2_tVALID) when slv_reg0_1 = '1' else '0';
		M_AXIS_tDATA(15 downto 0)     <= q_Tx_1_tDATA & "0000" when q_Tx_1_tVALID = '1' and slv_reg0_1 = '1' else (others=>'0');
		M_AXIS_tDATA(31 downto 16)    <= i_Tx_1_tDATA & "0000" when i_Tx_1_tVALID = '1' and slv_reg0_1 = '1' else (others=>'0');
		M_AXIS_tDATA(47 downto 32)    <= q_Tx_2_tDATA & "0000" when q_Tx_2_tVALID = '1' and slv_reg0_1 = '1' else (others=>'0');
		M_AXIS_tDATA(63 downto 48)    <= i_Tx_2_tDATA & "0000" when i_Tx_2_tVALID = '1' and slv_reg0_1 = '1' else (others=>'0');
		Tx_2_tRAEDY_int		          <= M_AXIS_tRAEDY when slv_reg0_1 = '1' else '0';
		i_Tx_1_tRAEDY		          <= Tx_2_tRAEDY_int;
		q_Tx_1_tRAEDY		          <= Tx_2_tRAEDY_int;
		i_Tx_2_tRAEDY		          <= Tx_2_tRAEDY_int;
		q_Tx_2_tRAEDY		          <= Tx_2_tRAEDY_int;
	end generate BYPASS;
	
	i_Tx_1_tRAEDY		<= Tx_1_tRAEDY_int;
--	Tx_1_tRAEDY_int		<= M_AXIS_tRAEDY when slv_reg0_1 = '1' else '0'; -- this module works only if the next ip is ready 
	Tx_1_tRAEDY_int		<= M_AXIS_tRAEDY; -- this module works only if the next ip is ready 
	
	nBYPASS : if(BYPASS_MODULATION=false) generate
        M_AXIS_tDATA(15 downto 0)     <= q_Tx_1_tDATA & "0000" when q_Tx_1_tVALID = '1' and slv_reg0_1 = '1' else (others=>'0');
		M_AXIS_tDATA(31 downto 16)    <= std_logic_vector(product1(25 downto 14)) & "0000";
		M_AXIS_tDATA(47 downto 32)    <= q_Tx_2_tDATA & "0000" when q_Tx_2_tVALID = '1' and slv_reg0_1 = '1' else (others=>'0');
		M_AXIS_tDATA(63 downto 48)    <= i_Tx_2_tDATA & "0000" when i_Tx_2_tVALID = '1' and slv_reg0_1 = '1' else (others=>'0');		
        sin_data		  			  <= to_signed(SIN_TABLE(to_integer(sin_indx)),SIN_DATA_WIDTH);							
		AM_MODULATION : process(S_AXIS_ACLK)
		begin
			if rising_edge(S_AXIS_ACLK) then 
				clk_cnt			<= clk_cnt+1;
				M_AXIS_tVALID	<= '0';
				if(i_Tx_1_tVALID = '1' and Tx_1_tRAEDY_int = '1') then --- when Tx_1 is ready then next ip is ready too. 
				        Tx_1_tDATA_buff     <= i_Tx_1_tDATA;
				end if;
				if(clk_cnt=indx_cycle)then 
				--- the below lines implement this equation : (Tx_1 * 0.00045 +1) * sin(2*pi*CARRIER_FRQ)
				--- (s,11,0) * (s,0,14) = (s,12,14) => (s,0,14)	
				--- (s,0,14) + (s,1,14) = (s,1,14)	
				--- (s,1,14) * (s,10,0) = (s,12,14) => (s,11,0)
					sin_indx	      <= sin_indx+1;
					clk_cnt		      <= (others=>'0');	
					product			  <= constant1 * signed(Tx_1_tDATA_buff); --- * 0.00045			
					sum 			  <= product(14 downto 0) + constant2; -- +1
					product1		  <= sum * sin_data; -- 	* sin(2*pi*CARRIER_FRQ)
					M_AXIS_tVALID	  <= '1'; 									
				end if;	
			end if;
		end process;
	end generate nBYPASS;
	-- User logic ends

end arch_imp;
