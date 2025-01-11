`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2025 03:27:08 PM
// Design Name: 
// Module Name: Scoreboard
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
`ifndef INC_SCOREBOARD_SV
`define INC_SCOREBOARD_SV
`include "Packet.sv"
`include "router_itf.sv"
class Scoreboard;
    pkt_mbox drv_box;
    pkt_mbox rcv_box;
    integer count_err;    
    bit [3:0] port_in, port_out;
    function   new(pkt_mbox drv_box,pkt_mbox rcv_box,bit [3:0] port_in,bit [3:0] port_out);
    this.drv_box=drv_box;
    this.rcv_box=rcv_box;
    this.port_in=port_in;
    this.port_out=port_out;
    endfunction
    task check();
    integer i,j;
    bit [7:0] check_drv,check_rcv;
        Packet drv_box_temp, rcv_box_temp; 
        begin
        count_err  =0;
        
        this.drv_box.get(drv_box_temp);
        this.rcv_box.get(rcv_box_temp);
        if(drv_box_temp.payload.size()!=rcv_box_temp.payload.size()) begin
            $display("packet driver != packet_receiver");
        end
        else begin
        //kiểm tra có bao nhiêu gia trị bị lỗi
            for(i=0;i<drv_box_temp.payload.size();i=i+1) begin
                check_drv=drv_box_temp.payload.pop_front();
                check_rcv=rcv_box_temp.payload.pop_front();
                if (check_drv!=check_rcv) begin
                    for(j=0;j<=7;j=j+1) begin
                        if(check_drv[j]!=check_rcv[j]) begin
                            count_err= count_err+1;
                        end
                        else count_err=count_err;
                    end
                end
            end
            if(count_err==0) begin
                $display("port in %d match port out %d",this.port_in,this.port_out);
            end
        end
        end
    endtask
endclass
`endif
module Scoreboard(

    );
endmodule
