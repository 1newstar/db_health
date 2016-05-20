-- Created on 2016-05-20 by Peng Liu 
set serveroutput on
set feedback off

declare
  --����Ƕ�ױ�����
  TYPE list_of_arguments IS TABLE OF varchar2(200);
  --����Ƕ�ױ�
  in_arguments list_of_arguments := list_of_arguments();
  --�����ַ�����������
  arguments varchar2(1000) := '&1' || ',';
  --arguments varchar2(1000) := 'table,order by,haha,objects,';
  --��Ŷ��ŵ�λ�ñ���
  l_comma_index PLS_INTEGER;
  --��Լ����ĸ��ʼλ�ñ���
  l_index PLS_INTEGER := 1;
  l_row   pls_integer;
begin
  LOOP
    --��l_index����ʼ��Ѱ�ַ�','
    l_comma_index := INSTR(arguments, ',', l_index);
    --�ָ���Ϻ��˳�
    EXIT WHEN l_comma_index = 0;
    --��չǶ�ױ�
    in_arguments.EXTEND;
    --��ȡ��ԼID����ֵ
    in_arguments(in_arguments.COUNT) := SUBSTR(arguments,
                                               l_index,
                                               l_comma_index - l_index);
    --������һ����ԼID������ĸ��ʼλ��                             
    l_index := l_comma_index + 1;
  END LOOP;
  dbms_output.put_line('<ul>');
  --����Ƕ�ױ�
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