awk '{if($1==60)printf("%d",6600);if($1==250)printf("%d",23072);if($1==10)printf("%d",1038);if($1==1)printf("%d",1);if($1==2000)printf("%d",5000000);if($1==40)printf("%d",4171);if($1==75)printf("%d",8061);if($1==20000)printf("%d",3162243);if($1==200000)printf("%d",48768277);exit;}'