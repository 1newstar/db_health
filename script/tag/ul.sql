-- Created on 2016-05-20 by Peng Liu 
set serveroutput on
set feedback off

declare
  --声明嵌套表类型
  TYPE list_of_arguments IS TABLE OF varchar2(200);
  --声明嵌套表
  in_arguments list_of_arguments := list_of_arguments();
  --声明字符串参数变量
  arguments varchar2(1000) := '&1' || ',';
  --arguments varchar2(1000) := 'table,order by,haha,objects,';
  --存放逗号的位置变量
  l_comma_index PLS_INTEGER;
  --合约首字母开始位置变量
  l_index PLS_INTEGER := 1;
  l_row   pls_integer;
begin
  LOOP
    --从l_index处开始搜寻字符','
    l_comma_index := INSTR(arguments, ',', l_index);
    --分隔完毕后退出
    EXIT WHEN l_comma_index = 0;
    --扩展嵌套表
    in_arguments.EXTEND;
    --截取合约ID并赋值
    in_arguments(in_arguments.COUNT) := SUBSTR(arguments,
                                               l_index,
                                               l_comma_index - l_index);
    --跳到下一个合约ID的首字母开始位置                             
    l_index := l_comma_index + 1;
  END LOOP;
  dbms_output.put_line('<ul>');
  --遍历嵌套表
  l_row := in_arguments.first;
  while l_row is not null loop
    dbms_output.put_line(q'{<li class="awr"><a class="awr" href="#}' ||
                         in_arguments(l_row) || q'{">}' ||
                         in_arguments(l_row) || q'{</a></li>}');
    l_row := in_arguments.next(l_row);
  end loop;
  dbms_output.put_line('</ul>');
end;
/
set feedback on