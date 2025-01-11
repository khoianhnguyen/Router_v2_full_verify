`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2025 12:18:44 AM
// Design Name: 
// Module Name: test
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
`include "Packet.sv"
`include "router_itf.sv"
`include "Driver.sv"
`include "Generate.sv"
`include "Receiver.sv"
`include "Scoreboard.sv"
program automatic test(router_io rtr_io);
    Generator gen;
    Driver drv[16];
    Receiver rcv[16];
    Scoreboard sb[16];
    semaphore sem[16];
    pkt_mbox receive_box[16],driver_box[16];
    integer i;
    initial begin
    gen=new();
    foreach(sem[i]) begin
        sem[i]=new(1);
    end
//        reset(rtr_io);
//        gen.gen(0,1,40);
//        drv[0]=new(rtr_io,gen.out_box[0],sem);
//        rcv[0]=new(rtr_io,0,1);
//        driver_box[0]=new();
//        receive_box[0]=new();
//        sb[0]=new(driver_box[0],receive_box[0],0,1);
//        #50
//        fork
//            drv[0].drv_srl(driver_box[0]);
//            rcv[0].rcvr(receive_box[0]);
//        join
//        sb[0].check();
        reset(rtr_io);

            reset(rtr_io);
        for(i=0;i<=15;i=i+1) begin
            gen.gen(i,15,40);
            drv[i]=new(rtr_io,gen.out_box[i],sem);
            rcv[i]=new(rtr_io,i,15);
            driver_box[i]=new();
            receive_box[i]=new();
            sb[i]=new(driver_box[i],receive_box[i],i,15);
        end
            fork
                drv[0].drv_prl(driver_box[0]);
                rcv[0].rcvr(receive_box[0]);
                drv[1].drv_prl(driver_box[1]);
                rcv[1].rcvr(receive_box[1]);
                drv[2].drv_prl(driver_box[2]);
                rcv[2].rcvr(receive_box[2]);
                drv[3].drv_prl(driver_box[3]);
                rcv[3].rcvr(receive_box[3]);
                drv[4].drv_prl(driver_box[4]);
                rcv[4].rcvr(receive_box[4]);
                drv[5].drv_prl(driver_box[5]);
                rcv[5].rcvr(receive_box[5]);
                drv[6].drv_prl(driver_box[6]);
                rcv[6].rcvr(receive_box[6]);
                drv[7].drv_prl(driver_box[7]);
                rcv[7].rcvr(receive_box[7]);
                drv[8].drv_prl(driver_box[8]);
                rcv[8].rcvr(receive_box[8]);
                drv[9].drv_prl(driver_box[9]);
                rcv[9].rcvr(receive_box[9]);
                drv[10].drv_prl(driver_box[10]);
                rcv[10].rcvr(receive_box[10]);
                drv[11].drv_prl(driver_box[11]);
                rcv[11].rcvr(receive_box[11]);
                rcv[12].rcvr(receive_box[12]);
                drv[12].drv_prl(driver_box[12]);
                rcv[13].rcvr(receive_box[13]);
                drv[13].drv_prl(driver_box[13]);
                rcv[14].rcvr(receive_box[14]);
                drv[14].drv_prl(driver_box[14]);
                rcv[15].rcvr(receive_box[15]);
                drv[15].drv_prl(driver_box[15]);
            join
            sb[0].check();
            sb[1].check();
            sb[2].check();
            sb[3].check();
            sb[4].check();
            sb[5].check();
            sb[6].check();
            sb[7].check();
            sb[8].check();
            sb[9].check();
            sb[10].check();
            sb[11].check();
            sb[12].check();
            sb[13].check();
            sb[14].check();
            sb[15].check();
                    for(i=0;i<=15;i=i+1) begin
            gen.gen(i,i,40);
            drv[i]=new(rtr_io,gen.out_box[i],sem);
            rcv[i]=new(rtr_io,i,i);
            driver_box[i]=new();
            receive_box[i]=new();
            sb[i]=new(driver_box[i],receive_box[i],i,i);
        end
            fork
                drv[0].drv_prl(driver_box[0]);
                rcv[0].rcvr(receive_box[0]);
                drv[1].drv_prl(driver_box[1]);
                rcv[1].rcvr(receive_box[1]);
                drv[2].drv_prl(driver_box[2]);
                rcv[2].rcvr(receive_box[2]);
                drv[3].drv_prl(driver_box[3]);
                rcv[3].rcvr(receive_box[3]);
                drv[4].drv_prl(driver_box[4]);
                rcv[4].rcvr(receive_box[4]);
                drv[5].drv_prl(driver_box[5]);
                rcv[5].rcvr(receive_box[5]);
                drv[6].drv_prl(driver_box[6]);
                rcv[6].rcvr(receive_box[6]);
                drv[7].drv_prl(driver_box[7]);
                rcv[7].rcvr(receive_box[7]);
                drv[8].drv_prl(driver_box[8]);
                rcv[8].rcvr(receive_box[8]);
                drv[9].drv_prl(driver_box[9]);
                rcv[9].rcvr(receive_box[9]);
                drv[10].drv_prl(driver_box[10]);
                rcv[10].rcvr(receive_box[10]);
                drv[11].drv_prl(driver_box[11]);
                rcv[11].rcvr(receive_box[11]);
                rcv[12].rcvr(receive_box[12]);
                drv[12].drv_prl(driver_box[12]);
                rcv[13].rcvr(receive_box[13]);
                drv[13].drv_prl(driver_box[13]);
                rcv[14].rcvr(receive_box[14]);
                drv[14].drv_prl(driver_box[14]);
                rcv[15].rcvr(receive_box[15]);
                drv[15].drv_prl(driver_box[15]);
            join
            sb[0].check();
            sb[1].check();
            sb[2].check();
            sb[3].check();
            sb[4].check();
            sb[5].check();
            sb[6].check();
            sb[7].check();
            sb[8].check();
            sb[9].check();
            sb[10].check();
            sb[11].check();
            sb[12].check();
            sb[13].check();
            sb[14].check();
            sb[15].check();
    end
    task test1(virtual router_io rtr_io,Generator gen,Driver drv, Receiver rcv,semaphore sem[],Scoreboard sb,pkt_mbox driver_box,receive_box); 
        begin
        reset(rtr_io);
        gen.gen(0,1,40);
        drv=new(rtr_io,gen.out_box[0],sem);
        rcv=new(rtr_io,0,1);
        driver_box=new();
        receive_box=new();
        sb=new(driver_box,receive_box,0,1);
        #50
        fork
            drv.drv_srl(driver_box);
            rcv.rcvr(receive_box);
        join
        sb.check();
        end
    endtask
    task reset(virtual router_io rtr_io);
    begin
        rtr_io.TB.reset_n<=1'b0;
        #20 rtr_io.TB.reset_n<=1'b1;
    end
    endtask
    task test2(virtual router_io rtr_io,Generator gen,Driver drv[], Receiver rcv[],semaphore sem[],Scoreboard sb[],pkt_mbox driver_box[],receive_box[]); 
        integer i;
    begin
        reset(rtr_io);
        for(i=0;i<=15;i=i+1) begin
            gen.gen(i,i,40);
            drv[i]=new(rtr_io,gen.out_box[i],sem);
            rcv[i]=new(rtr_io,i,i);
            driver_box[i]=new();
            receive_box[i]=new();
            sb[i]=new(driver_box[i],receive_box[i],i,i);
        end
            fork
                drv[0].drv_prl(driver_box[0]);
                rcv[0].rcvr(receive_box[0]);
            join
//            sb[0].check();
    end
    endtask
endprogram
module test_tb(

    );
    bit clk;
    router_io rtr_io(clk);
    test t(rtr_io);
    router DUT(.clk(clk),.reset_n(rtr_io.reset_n),.din(rtr_io.din),.frame_n(rtr_io.frame_n),.valid_n(rtr_io.valid_n)
        ,.frame_o(rtr_io.frameo_n)
        ,.valid_o(rtr_io.valido_n)
        ,.dout(rtr_io.dout));
    initial begin
    clk=0;
    
    end
    always #5 clk=!clk;
endmodule
