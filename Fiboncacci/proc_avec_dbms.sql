CREATE OR REPLACE procedure Fibonacci_Series(n  number)is
fs1 number := 0;
fs2 number := 1;
fs3 number;
cnt number default 0;
begin
dbms_output.put_line(fs1);
dbms_output.put_line(fs2);
while cnt!= n-2
loop
  fs3:=fs1+fs2;
  dbms_output.put_line(fs3);
  fs1:=fs2;
  fs2:=fs3;
  cnt:=cnt+1;
end loop;
exception
when others then
dbms_output.put_line(sqlerrm);
end;
/
/*APPEL
EXECUTE Fibonacci_Series(20);
*/
