`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 10:15:59 PM
// Design Name: 
// Module Name: Receiver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`ifndef INC_RECEIVER_SV
`define INC_RECEIVER_SV
`include "Packet.sv"
`include "router_itf.sv"
class Receiver;
    pkt_mbox out_box;
    bit [3:0] sa,da;
    bit [7:0] queuecmp[$];
    virtual router_io.TB rtr_io;
    function new(virtual router_io.TB rtr_io,bit[3:0] port_in, port_out);
    this.rtr_io=rtr_io;
    this.sa=port_in; 
    this.da=port_out;
    endfunction
    task rcvr(pkt_mbox out_box);
    get_payload(out_box);    
    endtask
    task get_payload(pkt_mbox out_box);
    logic [7:0] get_byte=0;
    logic payload[$];
    bit temp;
    integer i;
        begin
        Packet pkt_recv;
        pkt_recv=new(this.sa,this.da);
        @(negedge rtr_io.cb.frameo_n[this.da]);
        while (rtr_io.cb.frameo_n[this.da]==0) begin
            if(rtr_io.cb.valido_n[this.da]==0) begin
                payload.push_back(rtr_io.cb.dout[this.da]);
//                $display("%b",rtr_io.cb.dout[this.da]);  
                @(this.rtr_io.cb);
            end
            end
                payload.push_back(rtr_io.cb.dout[this.da]);
            while (payload.size()>0) begin
            for (i=0;i<=7;i=i+1) begin
                temp=payload.pop_front();
                get_byte={temp,get_byte[7:1]};                
            end
                queuecmp.push_back(get_byte);
                pkt_recv.payload.push_back(get_byte);
//                $display("%d",get_byte);                  
            end
            out_box.put(pkt_recv);
        end
        
    endtask
endclass 
`endif
module Receiver(

    );
endmodule
