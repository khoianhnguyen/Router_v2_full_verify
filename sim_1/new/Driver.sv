`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2025 11:52:47 PM
// Design Name: 
// Module Name: Driver
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
`ifndef INC_DRIVER_SV
`define INC_DRIVER_SV
`include "router_itf.sv"
`include "Packet.sv"
`include "Generate.sv"
class Driver;
    virtual router_io.TB rtr_io;
    pkt_mbox in_box,out_box;
    semaphore sem[];
    function new(virtual router_io.TB rtr_io,pkt_mbox in_box,semaphore sem[]); 
        this.rtr_io=rtr_io;
        this.in_box=in_box;
        this.out_box=out_box;
        this.sem=sem;
    endfunction
    task drv_srl(pkt_mbox driver_box);
        Packet pkt;
        this.in_box.get(pkt);
        begin
            this.rtr_io.cb.frame_n[pkt.sa]<=1'b0;
            this.rtr_io.cb.valid_n[pkt.sa]<=1'b0;
            send_addr(pkt);
//            $display(sem[pkt.da]);
            send_payload_srl(pkt,driver_box);
        end
    endtask
    task drv_prl(pkt_mbox driver_box);
        Packet pkt;
        this.in_box.get(pkt);
        begin
            this.rtr_io.cb.frame_n[pkt.sa]<=1'b0;
            this.rtr_io.cb.valid_n[pkt.sa]<=1'b0;
            send_addr(pkt);
//            $display(sem[pkt.da]);
            send_payload_prl(pkt,driver_box);
        end
    endtask
    task send_addr(Packet pkt);
//        $display(pkt.da);
        begin
            @(this.rtr_io.cb);
            this.rtr_io.cb.din[pkt.sa]<=pkt.da[0];
//            $display("%b",pkt.da[0]);
            @(this.rtr_io.cb);
            this.rtr_io.cb.din[pkt.sa]<=pkt.da[1];
//            $display("%b",pkt.da[1]);
            @(this.rtr_io.cb);
            this.rtr_io.cb.din[pkt.sa]<=pkt.da[2];
//            $display("%b",pkt.da[2]);
            @(this.rtr_io.cb);
            this.rtr_io.cb.din[pkt.sa]<=pkt.da[3];
//            $display("%b",pkt.da[3]);
            @(this.rtr_io.cb);
        end
    endtask
    task send_payload_srl(Packet pkt,pkt_mbox driver_box);
        bit [7:0] payload;
        Packet pkt_outbox;
        integer i;
        begin
            sem[pkt.da].get(1);
            pkt_outbox=new(pkt.sa,pkt.da);
            while(pkt.payload.size()>0) begin
                 payload=pkt.payload.pop_front();
                 pkt_outbox.payload.push_back(payload);
//                 $display("%d",payload);
                 for(i=0;i<=7;i=i+1) begin
                    this.rtr_io.cb.din[pkt.sa]<=payload[i];
                     if(pkt.payload.size()==0 &&i==7) begin
                        this.rtr_io.cb.frame_n[pkt.sa]<=1'b1;
                     end
                     @(this.rtr_io.cb);
                 end
            end
            out_box=new();
//            $display(pkt_outbox.payload);
            this.out_box.put(pkt_outbox);
            driver_box.put(pkt_outbox);
            sem[pkt.da].put(1);
        end
    endtask
    task send_payload_prl(Packet pkt,pkt_mbox driver_box);
        bit [7:0] payload;
        Packet pkt_outbox;
        integer i;
        begin
            pkt_outbox=new(pkt.sa,pkt.da);
            while(pkt.payload.size()>0) begin
                 payload=pkt.payload.pop_front();
                 pkt_outbox.payload.push_back(payload);
//                 $display("%d",payload);
                 for(i=0;i<=7;i=i+1) begin
                    this.rtr_io.cb.din[pkt.sa]<=payload[i];
                     if(pkt.payload.size()==0 &&i==7) begin
                        this.rtr_io.cb.frame_n[pkt.sa]<=1'b1;
                     end
                     @(this.rtr_io.cb);
                 end
            end
            out_box=new();
//            $display(pkt_outbox.payload);
            this.out_box.put(pkt_outbox);
            driver_box.put(pkt_outbox);
        end
    endtask
endclass
`endif
module Driver(

    );
    bit clk;
    router_io rtr_io(clk);
    pkt_mbox gen2driv[16],out_box_driv[16], receiver_mbox[16];
    router DUT(.clk(clk),.reset_n(rtr_io.reset_n),.din(rtr_io.din),.frame_n(rtr_io.frame_n),.valid_n(rtr_io.valid_n)
        ,.frame_o(rtr_io.frameo_n)
        ,.valid_o(rtr_io.valido_n)
        ,.dout(rtr_io.dout));
    Driver drvr[2];
    Generator gnr;
    semaphore sem[16];
    Receiver rcv[2];
    initial begin
//        clk=0;
//        foreach(sem[i]) begin
//        sem[i]=new(1);
//        rtr_io.TB.reset_n=0;
//        #50 rtr_io.TB.reset_n=1;
//        end
//        gnr=new();
//        gnr.gen(14,7,50);
//        gnr.gen(12,7,15);
//        gen2driv[14]=gnr.out_box[14];
//        gen2driv[12]=gnr.out_box[12];
//        drvr[0]=new(rtr_io,gen2driv[14],sem);  
//        drvr[1]=new(rtr_io,gen2driv[12],sem);
//        rcv[0]=new(rtr_io.TB,receiver_mbox[0],12,7);
//        fork 
//        drvr[0].drv();
//        rcv[0].rcvr();
//        drvr[1].drv();
//        join
//        out_box_driv[0]=drvr[0].out_box;
//        out_box_driv[1]=drvr[1].out_box;
    end
    always #5 clk=~clk;
endmodule 

