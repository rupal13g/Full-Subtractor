module fs_tb;
  reg ta, tb, tbin;
  wire td, tbout;
  integer i, j;
  full_sub fsb(.a(ta), .b(tb), .bin(tbin), .d(td), .bout(tbout));
  initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end
  initial
    begin
      $monitor (ta, tb, tbin, td, tbout);
      tbin = 1'b0;
      for (i=0; i<4; i=i+1)
        begin
          {ta, tb} = i;
          #10;
        end
      tbin = 1'b1;
      for (j=0; j<5; j=j+1)
        begin
          {ta, tb} = j;
          #10;
        end
    end
endmodule
