
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
       6:	68 3c 3c 00 00       	push   $0x3c3c
       b:	ff 35 d4 5c 00 00    	push   0x5cd4
      11:	e8 e2 38 00 00       	call   38f8 <printf>

  if(mkdir("iputdir") < 0){
      16:	c7 04 24 cf 3b 00 00 	movl   $0x3bcf,(%esp)
      1d:	e8 e9 37 00 00       	call   380b <mkdir>
      22:	83 c4 10             	add    $0x10,%esp
      25:	85 c0                	test   %eax,%eax
      27:	78 54                	js     7d <iputtest+0x7d>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
      29:	83 ec 0c             	sub    $0xc,%esp
      2c:	68 cf 3b 00 00       	push   $0x3bcf
      31:	e8 dd 37 00 00       	call   3813 <chdir>
      36:	83 c4 10             	add    $0x10,%esp
      39:	85 c0                	test   %eax,%eax
      3b:	78 58                	js     95 <iputtest+0x95>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
      3d:	83 ec 0c             	sub    $0xc,%esp
      40:	68 cc 3b 00 00       	push   $0x3bcc
      45:	e8 a9 37 00 00       	call   37f3 <unlink>
      4a:	83 c4 10             	add    $0x10,%esp
      4d:	85 c0                	test   %eax,%eax
      4f:	78 5c                	js     ad <iputtest+0xad>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
      51:	83 ec 0c             	sub    $0xc,%esp
      54:	68 f1 3b 00 00       	push   $0x3bf1
      59:	e8 b5 37 00 00       	call   3813 <chdir>
      5e:	83 c4 10             	add    $0x10,%esp
      61:	85 c0                	test   %eax,%eax
      63:	78 60                	js     c5 <iputtest+0xc5>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
      65:	83 ec 08             	sub    $0x8,%esp
      68:	68 74 3c 00 00       	push   $0x3c74
      6d:	ff 35 d4 5c 00 00    	push   0x5cd4
      73:	e8 80 38 00 00       	call   38f8 <printf>
}
      78:	83 c4 10             	add    $0x10,%esp
      7b:	c9                   	leave  
      7c:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
      7d:	83 ec 08             	sub    $0x8,%esp
      80:	68 a8 3b 00 00       	push   $0x3ba8
      85:	ff 35 d4 5c 00 00    	push   0x5cd4
      8b:	e8 68 38 00 00       	call   38f8 <printf>
    exit();
      90:	e8 0e 37 00 00       	call   37a3 <exit>
    printf(stdout, "chdir iputdir failed\n");
      95:	83 ec 08             	sub    $0x8,%esp
      98:	68 b6 3b 00 00       	push   $0x3bb6
      9d:	ff 35 d4 5c 00 00    	push   0x5cd4
      a3:	e8 50 38 00 00       	call   38f8 <printf>
    exit();
      a8:	e8 f6 36 00 00       	call   37a3 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
      ad:	83 ec 08             	sub    $0x8,%esp
      b0:	68 d7 3b 00 00       	push   $0x3bd7
      b5:	ff 35 d4 5c 00 00    	push   0x5cd4
      bb:	e8 38 38 00 00       	call   38f8 <printf>
    exit();
      c0:	e8 de 36 00 00       	call   37a3 <exit>
    printf(stdout, "chdir / failed\n");
      c5:	83 ec 08             	sub    $0x8,%esp
      c8:	68 f3 3b 00 00       	push   $0x3bf3
      cd:	ff 35 d4 5c 00 00    	push   0x5cd4
      d3:	e8 20 38 00 00       	call   38f8 <printf>
    exit();
      d8:	e8 c6 36 00 00       	call   37a3 <exit>

000000dd <exitiputtest>:

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
      dd:	55                   	push   %ebp
      de:	89 e5                	mov    %esp,%ebp
      e0:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
      e3:	68 03 3c 00 00       	push   $0x3c03
      e8:	ff 35 d4 5c 00 00    	push   0x5cd4
      ee:	e8 05 38 00 00       	call   38f8 <printf>

  pid = fork();
      f3:	e8 a3 36 00 00       	call   379b <fork>
  if(pid < 0){
      f8:	83 c4 10             	add    $0x10,%esp
      fb:	85 c0                	test   %eax,%eax
      fd:	78 47                	js     146 <exitiputtest+0x69>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
      ff:	0f 85 a1 00 00 00    	jne    1a6 <exitiputtest+0xc9>
    if(mkdir("iputdir") < 0){
     105:	83 ec 0c             	sub    $0xc,%esp
     108:	68 cf 3b 00 00       	push   $0x3bcf
     10d:	e8 f9 36 00 00       	call   380b <mkdir>
     112:	83 c4 10             	add    $0x10,%esp
     115:	85 c0                	test   %eax,%eax
     117:	78 45                	js     15e <exitiputtest+0x81>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     119:	83 ec 0c             	sub    $0xc,%esp
     11c:	68 cf 3b 00 00       	push   $0x3bcf
     121:	e8 ed 36 00 00       	call   3813 <chdir>
     126:	83 c4 10             	add    $0x10,%esp
     129:	85 c0                	test   %eax,%eax
     12b:	78 49                	js     176 <exitiputtest+0x99>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     12d:	83 ec 0c             	sub    $0xc,%esp
     130:	68 cc 3b 00 00       	push   $0x3bcc
     135:	e8 b9 36 00 00       	call   37f3 <unlink>
     13a:	83 c4 10             	add    $0x10,%esp
     13d:	85 c0                	test   %eax,%eax
     13f:	78 4d                	js     18e <exitiputtest+0xb1>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     141:	e8 5d 36 00 00       	call   37a3 <exit>
    printf(stdout, "fork failed\n");
     146:	83 ec 08             	sub    $0x8,%esp
     149:	68 e9 4a 00 00       	push   $0x4ae9
     14e:	ff 35 d4 5c 00 00    	push   0x5cd4
     154:	e8 9f 37 00 00       	call   38f8 <printf>
    exit();
     159:	e8 45 36 00 00       	call   37a3 <exit>
      printf(stdout, "mkdir failed\n");
     15e:	83 ec 08             	sub    $0x8,%esp
     161:	68 a8 3b 00 00       	push   $0x3ba8
     166:	ff 35 d4 5c 00 00    	push   0x5cd4
     16c:	e8 87 37 00 00       	call   38f8 <printf>
      exit();
     171:	e8 2d 36 00 00       	call   37a3 <exit>
      printf(stdout, "child chdir failed\n");
     176:	83 ec 08             	sub    $0x8,%esp
     179:	68 12 3c 00 00       	push   $0x3c12
     17e:	ff 35 d4 5c 00 00    	push   0x5cd4
     184:	e8 6f 37 00 00       	call   38f8 <printf>
      exit();
     189:	e8 15 36 00 00       	call   37a3 <exit>
      printf(stdout, "unlink ../iputdir failed\n");
     18e:	83 ec 08             	sub    $0x8,%esp
     191:	68 d7 3b 00 00       	push   $0x3bd7
     196:	ff 35 d4 5c 00 00    	push   0x5cd4
     19c:	e8 57 37 00 00       	call   38f8 <printf>
      exit();
     1a1:	e8 fd 35 00 00       	call   37a3 <exit>
  }
  wait();
     1a6:	e8 00 36 00 00       	call   37ab <wait>
  printf(stdout, "exitiput test ok\n");
     1ab:	83 ec 08             	sub    $0x8,%esp
     1ae:	68 26 3c 00 00       	push   $0x3c26
     1b3:	ff 35 d4 5c 00 00    	push   0x5cd4
     1b9:	e8 3a 37 00 00       	call   38f8 <printf>
}
     1be:	83 c4 10             	add    $0x10,%esp
     1c1:	c9                   	leave  
     1c2:	c3                   	ret    

000001c3 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     1c3:	55                   	push   %ebp
     1c4:	89 e5                	mov    %esp,%ebp
     1c6:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     1c9:	68 38 3c 00 00       	push   $0x3c38
     1ce:	ff 35 d4 5c 00 00    	push   0x5cd4
     1d4:	e8 1f 37 00 00       	call   38f8 <printf>
  if(mkdir("oidir") < 0){
     1d9:	c7 04 24 47 3c 00 00 	movl   $0x3c47,(%esp)
     1e0:	e8 26 36 00 00       	call   380b <mkdir>
     1e5:	83 c4 10             	add    $0x10,%esp
     1e8:	85 c0                	test   %eax,%eax
     1ea:	78 39                	js     225 <openiputtest+0x62>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     1ec:	e8 aa 35 00 00       	call   379b <fork>
  if(pid < 0){
     1f1:	85 c0                	test   %eax,%eax
     1f3:	78 48                	js     23d <openiputtest+0x7a>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     1f5:	75 63                	jne    25a <openiputtest+0x97>
    int fd = open("oidir", O_RDWR);
     1f7:	83 ec 08             	sub    $0x8,%esp
     1fa:	6a 02                	push   $0x2
     1fc:	68 47 3c 00 00       	push   $0x3c47
     201:	e8 dd 35 00 00       	call   37e3 <open>
    if(fd >= 0){
     206:	83 c4 10             	add    $0x10,%esp
     209:	85 c0                	test   %eax,%eax
     20b:	78 48                	js     255 <openiputtest+0x92>
      printf(stdout, "open directory for write succeeded\n");
     20d:	83 ec 08             	sub    $0x8,%esp
     210:	68 cc 4b 00 00       	push   $0x4bcc
     215:	ff 35 d4 5c 00 00    	push   0x5cd4
     21b:	e8 d8 36 00 00       	call   38f8 <printf>
      exit();
     220:	e8 7e 35 00 00       	call   37a3 <exit>
    printf(stdout, "mkdir oidir failed\n");
     225:	83 ec 08             	sub    $0x8,%esp
     228:	68 4d 3c 00 00       	push   $0x3c4d
     22d:	ff 35 d4 5c 00 00    	push   0x5cd4
     233:	e8 c0 36 00 00       	call   38f8 <printf>
    exit();
     238:	e8 66 35 00 00       	call   37a3 <exit>
    printf(stdout, "fork failed\n");
     23d:	83 ec 08             	sub    $0x8,%esp
     240:	68 e9 4a 00 00       	push   $0x4ae9
     245:	ff 35 d4 5c 00 00    	push   0x5cd4
     24b:	e8 a8 36 00 00       	call   38f8 <printf>
    exit();
     250:	e8 4e 35 00 00       	call   37a3 <exit>
    }
    exit();
     255:	e8 49 35 00 00       	call   37a3 <exit>
  }
  sleep(1);
     25a:	83 ec 0c             	sub    $0xc,%esp
     25d:	6a 01                	push   $0x1
     25f:	e8 cf 35 00 00       	call   3833 <sleep>
  if(unlink("oidir") != 0){
     264:	c7 04 24 47 3c 00 00 	movl   $0x3c47,(%esp)
     26b:	e8 83 35 00 00       	call   37f3 <unlink>
     270:	83 c4 10             	add    $0x10,%esp
     273:	85 c0                	test   %eax,%eax
     275:	75 1d                	jne    294 <openiputtest+0xd1>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     277:	e8 2f 35 00 00       	call   37ab <wait>
  printf(stdout, "openiput test ok\n");
     27c:	83 ec 08             	sub    $0x8,%esp
     27f:	68 70 3c 00 00       	push   $0x3c70
     284:	ff 35 d4 5c 00 00    	push   0x5cd4
     28a:	e8 69 36 00 00       	call   38f8 <printf>
}
     28f:	83 c4 10             	add    $0x10,%esp
     292:	c9                   	leave  
     293:	c3                   	ret    
    printf(stdout, "unlink failed\n");
     294:	83 ec 08             	sub    $0x8,%esp
     297:	68 61 3c 00 00       	push   $0x3c61
     29c:	ff 35 d4 5c 00 00    	push   0x5cd4
     2a2:	e8 51 36 00 00       	call   38f8 <printf>
    exit();
     2a7:	e8 f7 34 00 00       	call   37a3 <exit>

000002ac <opentest>:

// simple file system tests

void
opentest(void)
{
     2ac:	55                   	push   %ebp
     2ad:	89 e5                	mov    %esp,%ebp
     2af:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     2b2:	68 82 3c 00 00       	push   $0x3c82
     2b7:	ff 35 d4 5c 00 00    	push   0x5cd4
     2bd:	e8 36 36 00 00       	call   38f8 <printf>
  fd = open("echo", 0);
     2c2:	83 c4 08             	add    $0x8,%esp
     2c5:	6a 00                	push   $0x0
     2c7:	68 8d 3c 00 00       	push   $0x3c8d
     2cc:	e8 12 35 00 00       	call   37e3 <open>
  if(fd < 0){
     2d1:	83 c4 10             	add    $0x10,%esp
     2d4:	85 c0                	test   %eax,%eax
     2d6:	78 37                	js     30f <opentest+0x63>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     2d8:	83 ec 0c             	sub    $0xc,%esp
     2db:	50                   	push   %eax
     2dc:	e8 ea 34 00 00       	call   37cb <close>
  fd = open("doesnotexist", 0);
     2e1:	83 c4 08             	add    $0x8,%esp
     2e4:	6a 00                	push   $0x0
     2e6:	68 a5 3c 00 00       	push   $0x3ca5
     2eb:	e8 f3 34 00 00       	call   37e3 <open>
  if(fd >= 0){
     2f0:	83 c4 10             	add    $0x10,%esp
     2f3:	85 c0                	test   %eax,%eax
     2f5:	79 30                	jns    327 <opentest+0x7b>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     2f7:	83 ec 08             	sub    $0x8,%esp
     2fa:	68 d0 3c 00 00       	push   $0x3cd0
     2ff:	ff 35 d4 5c 00 00    	push   0x5cd4
     305:	e8 ee 35 00 00       	call   38f8 <printf>
}
     30a:	83 c4 10             	add    $0x10,%esp
     30d:	c9                   	leave  
     30e:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     30f:	83 ec 08             	sub    $0x8,%esp
     312:	68 92 3c 00 00       	push   $0x3c92
     317:	ff 35 d4 5c 00 00    	push   0x5cd4
     31d:	e8 d6 35 00 00       	call   38f8 <printf>
    exit();
     322:	e8 7c 34 00 00       	call   37a3 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     327:	83 ec 08             	sub    $0x8,%esp
     32a:	68 b2 3c 00 00       	push   $0x3cb2
     32f:	ff 35 d4 5c 00 00    	push   0x5cd4
     335:	e8 be 35 00 00       	call   38f8 <printf>
    exit();
     33a:	e8 64 34 00 00       	call   37a3 <exit>

0000033f <writetest>:

void
writetest(void)
{
     33f:	55                   	push   %ebp
     340:	89 e5                	mov    %esp,%ebp
     342:	56                   	push   %esi
     343:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     344:	83 ec 08             	sub    $0x8,%esp
     347:	68 de 3c 00 00       	push   $0x3cde
     34c:	ff 35 d4 5c 00 00    	push   0x5cd4
     352:	e8 a1 35 00 00       	call   38f8 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     357:	83 c4 08             	add    $0x8,%esp
     35a:	68 02 02 00 00       	push   $0x202
     35f:	68 ef 3c 00 00       	push   $0x3cef
     364:	e8 7a 34 00 00       	call   37e3 <open>
  if(fd >= 0){
     369:	83 c4 10             	add    $0x10,%esp
     36c:	85 c0                	test   %eax,%eax
     36e:	78 57                	js     3c7 <writetest+0x88>
     370:	89 c6                	mov    %eax,%esi
    printf(stdout, "creat small succeeded; ok\n");
     372:	83 ec 08             	sub    $0x8,%esp
     375:	68 f5 3c 00 00       	push   $0x3cf5
     37a:	ff 35 d4 5c 00 00    	push   0x5cd4
     380:	e8 73 35 00 00       	call   38f8 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     385:	83 c4 10             	add    $0x10,%esp
     388:	bb 00 00 00 00       	mov    $0x0,%ebx
     38d:	83 fb 63             	cmp    $0x63,%ebx
     390:	7f 7f                	jg     411 <writetest+0xd2>
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     392:	83 ec 04             	sub    $0x4,%esp
     395:	6a 0a                	push   $0xa
     397:	68 2c 3d 00 00       	push   $0x3d2c
     39c:	56                   	push   %esi
     39d:	e8 21 34 00 00       	call   37c3 <write>
     3a2:	83 c4 10             	add    $0x10,%esp
     3a5:	83 f8 0a             	cmp    $0xa,%eax
     3a8:	75 35                	jne    3df <writetest+0xa0>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     3aa:	83 ec 04             	sub    $0x4,%esp
     3ad:	6a 0a                	push   $0xa
     3af:	68 37 3d 00 00       	push   $0x3d37
     3b4:	56                   	push   %esi
     3b5:	e8 09 34 00 00       	call   37c3 <write>
     3ba:	83 c4 10             	add    $0x10,%esp
     3bd:	83 f8 0a             	cmp    $0xa,%eax
     3c0:	75 36                	jne    3f8 <writetest+0xb9>
  for(i = 0; i < 100; i++){
     3c2:	83 c3 01             	add    $0x1,%ebx
     3c5:	eb c6                	jmp    38d <writetest+0x4e>
    printf(stdout, "error: creat small failed!\n");
     3c7:	83 ec 08             	sub    $0x8,%esp
     3ca:	68 10 3d 00 00       	push   $0x3d10
     3cf:	ff 35 d4 5c 00 00    	push   0x5cd4
     3d5:	e8 1e 35 00 00       	call   38f8 <printf>
    exit();
     3da:	e8 c4 33 00 00       	call   37a3 <exit>
      printf(stdout, "error: write aa %d new file failed\n", i);
     3df:	83 ec 04             	sub    $0x4,%esp
     3e2:	53                   	push   %ebx
     3e3:	68 f0 4b 00 00       	push   $0x4bf0
     3e8:	ff 35 d4 5c 00 00    	push   0x5cd4
     3ee:	e8 05 35 00 00       	call   38f8 <printf>
      exit();
     3f3:	e8 ab 33 00 00       	call   37a3 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     3f8:	83 ec 04             	sub    $0x4,%esp
     3fb:	53                   	push   %ebx
     3fc:	68 14 4c 00 00       	push   $0x4c14
     401:	ff 35 d4 5c 00 00    	push   0x5cd4
     407:	e8 ec 34 00 00       	call   38f8 <printf>
      exit();
     40c:	e8 92 33 00 00       	call   37a3 <exit>
    }
  }
  printf(stdout, "writes ok\n");
     411:	83 ec 08             	sub    $0x8,%esp
     414:	68 42 3d 00 00       	push   $0x3d42
     419:	ff 35 d4 5c 00 00    	push   0x5cd4
     41f:	e8 d4 34 00 00       	call   38f8 <printf>
  close(fd);
     424:	89 34 24             	mov    %esi,(%esp)
     427:	e8 9f 33 00 00       	call   37cb <close>
  fd = open("small", O_RDONLY);
     42c:	83 c4 08             	add    $0x8,%esp
     42f:	6a 00                	push   $0x0
     431:	68 ef 3c 00 00       	push   $0x3cef
     436:	e8 a8 33 00 00       	call   37e3 <open>
     43b:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     43d:	83 c4 10             	add    $0x10,%esp
     440:	85 c0                	test   %eax,%eax
     442:	78 7b                	js     4bf <writetest+0x180>
    printf(stdout, "open small succeeded ok\n");
     444:	83 ec 08             	sub    $0x8,%esp
     447:	68 4d 3d 00 00       	push   $0x3d4d
     44c:	ff 35 d4 5c 00 00    	push   0x5cd4
     452:	e8 a1 34 00 00       	call   38f8 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     457:	83 c4 0c             	add    $0xc,%esp
     45a:	68 d0 07 00 00       	push   $0x7d0
     45f:	68 20 84 00 00       	push   $0x8420
     464:	53                   	push   %ebx
     465:	e8 51 33 00 00       	call   37bb <read>
  if(i == 2000){
     46a:	83 c4 10             	add    $0x10,%esp
     46d:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     472:	75 63                	jne    4d7 <writetest+0x198>
    printf(stdout, "read succeeded ok\n");
     474:	83 ec 08             	sub    $0x8,%esp
     477:	68 81 3d 00 00       	push   $0x3d81
     47c:	ff 35 d4 5c 00 00    	push   0x5cd4
     482:	e8 71 34 00 00       	call   38f8 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     487:	89 1c 24             	mov    %ebx,(%esp)
     48a:	e8 3c 33 00 00       	call   37cb <close>

  if(unlink("small") < 0){
     48f:	c7 04 24 ef 3c 00 00 	movl   $0x3cef,(%esp)
     496:	e8 58 33 00 00       	call   37f3 <unlink>
     49b:	83 c4 10             	add    $0x10,%esp
     49e:	85 c0                	test   %eax,%eax
     4a0:	78 4d                	js     4ef <writetest+0x1b0>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     4a2:	83 ec 08             	sub    $0x8,%esp
     4a5:	68 a9 3d 00 00       	push   $0x3da9
     4aa:	ff 35 d4 5c 00 00    	push   0x5cd4
     4b0:	e8 43 34 00 00       	call   38f8 <printf>
}
     4b5:	83 c4 10             	add    $0x10,%esp
     4b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
     4bb:	5b                   	pop    %ebx
     4bc:	5e                   	pop    %esi
     4bd:	5d                   	pop    %ebp
     4be:	c3                   	ret    
    printf(stdout, "error: open small failed!\n");
     4bf:	83 ec 08             	sub    $0x8,%esp
     4c2:	68 66 3d 00 00       	push   $0x3d66
     4c7:	ff 35 d4 5c 00 00    	push   0x5cd4
     4cd:	e8 26 34 00 00       	call   38f8 <printf>
    exit();
     4d2:	e8 cc 32 00 00       	call   37a3 <exit>
    printf(stdout, "read failed\n");
     4d7:	83 ec 08             	sub    $0x8,%esp
     4da:	68 ad 40 00 00       	push   $0x40ad
     4df:	ff 35 d4 5c 00 00    	push   0x5cd4
     4e5:	e8 0e 34 00 00       	call   38f8 <printf>
    exit();
     4ea:	e8 b4 32 00 00       	call   37a3 <exit>
    printf(stdout, "unlink small failed\n");
     4ef:	83 ec 08             	sub    $0x8,%esp
     4f2:	68 94 3d 00 00       	push   $0x3d94
     4f7:	ff 35 d4 5c 00 00    	push   0x5cd4
     4fd:	e8 f6 33 00 00       	call   38f8 <printf>
    exit();
     502:	e8 9c 32 00 00       	call   37a3 <exit>

00000507 <writetest1>:

void
writetest1(void)
{
     507:	55                   	push   %ebp
     508:	89 e5                	mov    %esp,%ebp
     50a:	56                   	push   %esi
     50b:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     50c:	83 ec 08             	sub    $0x8,%esp
     50f:	68 bd 3d 00 00       	push   $0x3dbd
     514:	ff 35 d4 5c 00 00    	push   0x5cd4
     51a:	e8 d9 33 00 00       	call   38f8 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     51f:	83 c4 08             	add    $0x8,%esp
     522:	68 02 02 00 00       	push   $0x202
     527:	68 37 3e 00 00       	push   $0x3e37
     52c:	e8 b2 32 00 00       	call   37e3 <open>
  if(fd < 0){
     531:	83 c4 10             	add    $0x10,%esp
     534:	85 c0                	test   %eax,%eax
     536:	78 37                	js     56f <writetest1+0x68>
     538:	89 c6                	mov    %eax,%esi
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     53a:	bb 00 00 00 00       	mov    $0x0,%ebx
     53f:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     545:	77 59                	ja     5a0 <writetest1+0x99>
    ((int*)buf)[0] = i;
     547:	89 1d 20 84 00 00    	mov    %ebx,0x8420
    if(write(fd, buf, 512) != 512){
     54d:	83 ec 04             	sub    $0x4,%esp
     550:	68 00 02 00 00       	push   $0x200
     555:	68 20 84 00 00       	push   $0x8420
     55a:	56                   	push   %esi
     55b:	e8 63 32 00 00       	call   37c3 <write>
     560:	83 c4 10             	add    $0x10,%esp
     563:	3d 00 02 00 00       	cmp    $0x200,%eax
     568:	75 1d                	jne    587 <writetest1+0x80>
  for(i = 0; i < MAXFILE; i++){
     56a:	83 c3 01             	add    $0x1,%ebx
     56d:	eb d0                	jmp    53f <writetest1+0x38>
    printf(stdout, "error: creat big failed!\n");
     56f:	83 ec 08             	sub    $0x8,%esp
     572:	68 cd 3d 00 00       	push   $0x3dcd
     577:	ff 35 d4 5c 00 00    	push   0x5cd4
     57d:	e8 76 33 00 00       	call   38f8 <printf>
    exit();
     582:	e8 1c 32 00 00       	call   37a3 <exit>
      printf(stdout, "error: write big file failed\n", i);
     587:	83 ec 04             	sub    $0x4,%esp
     58a:	53                   	push   %ebx
     58b:	68 e7 3d 00 00       	push   $0x3de7
     590:	ff 35 d4 5c 00 00    	push   0x5cd4
     596:	e8 5d 33 00 00       	call   38f8 <printf>
      exit();
     59b:	e8 03 32 00 00       	call   37a3 <exit>
    }
  }

  close(fd);
     5a0:	83 ec 0c             	sub    $0xc,%esp
     5a3:	56                   	push   %esi
     5a4:	e8 22 32 00 00       	call   37cb <close>

  fd = open("big", O_RDONLY);
     5a9:	83 c4 08             	add    $0x8,%esp
     5ac:	6a 00                	push   $0x0
     5ae:	68 37 3e 00 00       	push   $0x3e37
     5b3:	e8 2b 32 00 00       	call   37e3 <open>
     5b8:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     5ba:	83 c4 10             	add    $0x10,%esp
     5bd:	85 c0                	test   %eax,%eax
     5bf:	78 3c                	js     5fd <writetest1+0xf6>
    printf(stdout, "error: open big failed!\n");
    exit();
  }

  n = 0;
     5c1:	bb 00 00 00 00       	mov    $0x0,%ebx
  for(;;){
    i = read(fd, buf, 512);
     5c6:	83 ec 04             	sub    $0x4,%esp
     5c9:	68 00 02 00 00       	push   $0x200
     5ce:	68 20 84 00 00       	push   $0x8420
     5d3:	56                   	push   %esi
     5d4:	e8 e2 31 00 00       	call   37bb <read>
    if(i == 0){
     5d9:	83 c4 10             	add    $0x10,%esp
     5dc:	85 c0                	test   %eax,%eax
     5de:	74 35                	je     615 <writetest1+0x10e>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     5e0:	3d 00 02 00 00       	cmp    $0x200,%eax
     5e5:	0f 85 84 00 00 00    	jne    66f <writetest1+0x168>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     5eb:	a1 20 84 00 00       	mov    0x8420,%eax
     5f0:	39 d8                	cmp    %ebx,%eax
     5f2:	0f 85 90 00 00 00    	jne    688 <writetest1+0x181>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     5f8:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     5fb:	eb c9                	jmp    5c6 <writetest1+0xbf>
    printf(stdout, "error: open big failed!\n");
     5fd:	83 ec 08             	sub    $0x8,%esp
     600:	68 05 3e 00 00       	push   $0x3e05
     605:	ff 35 d4 5c 00 00    	push   0x5cd4
     60b:	e8 e8 32 00 00       	call   38f8 <printf>
    exit();
     610:	e8 8e 31 00 00       	call   37a3 <exit>
      if(n == MAXFILE - 1){
     615:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     61b:	74 39                	je     656 <writetest1+0x14f>
  }
  close(fd);
     61d:	83 ec 0c             	sub    $0xc,%esp
     620:	56                   	push   %esi
     621:	e8 a5 31 00 00       	call   37cb <close>
  if(unlink("big") < 0){
     626:	c7 04 24 37 3e 00 00 	movl   $0x3e37,(%esp)
     62d:	e8 c1 31 00 00       	call   37f3 <unlink>
     632:	83 c4 10             	add    $0x10,%esp
     635:	85 c0                	test   %eax,%eax
     637:	78 66                	js     69f <writetest1+0x198>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     639:	83 ec 08             	sub    $0x8,%esp
     63c:	68 5e 3e 00 00       	push   $0x3e5e
     641:	ff 35 d4 5c 00 00    	push   0x5cd4
     647:	e8 ac 32 00 00       	call   38f8 <printf>
}
     64c:	83 c4 10             	add    $0x10,%esp
     64f:	8d 65 f8             	lea    -0x8(%ebp),%esp
     652:	5b                   	pop    %ebx
     653:	5e                   	pop    %esi
     654:	5d                   	pop    %ebp
     655:	c3                   	ret    
        printf(stdout, "read only %d blocks from big", n);
     656:	83 ec 04             	sub    $0x4,%esp
     659:	53                   	push   %ebx
     65a:	68 1e 3e 00 00       	push   $0x3e1e
     65f:	ff 35 d4 5c 00 00    	push   0x5cd4
     665:	e8 8e 32 00 00       	call   38f8 <printf>
        exit();
     66a:	e8 34 31 00 00       	call   37a3 <exit>
      printf(stdout, "read failed %d\n", i);
     66f:	83 ec 04             	sub    $0x4,%esp
     672:	50                   	push   %eax
     673:	68 3b 3e 00 00       	push   $0x3e3b
     678:	ff 35 d4 5c 00 00    	push   0x5cd4
     67e:	e8 75 32 00 00       	call   38f8 <printf>
      exit();
     683:	e8 1b 31 00 00       	call   37a3 <exit>
      printf(stdout, "read content of block %d is %d\n",
     688:	50                   	push   %eax
     689:	53                   	push   %ebx
     68a:	68 38 4c 00 00       	push   $0x4c38
     68f:	ff 35 d4 5c 00 00    	push   0x5cd4
     695:	e8 5e 32 00 00       	call   38f8 <printf>
      exit();
     69a:	e8 04 31 00 00       	call   37a3 <exit>
    printf(stdout, "unlink big failed\n");
     69f:	83 ec 08             	sub    $0x8,%esp
     6a2:	68 4b 3e 00 00       	push   $0x3e4b
     6a7:	ff 35 d4 5c 00 00    	push   0x5cd4
     6ad:	e8 46 32 00 00       	call   38f8 <printf>
    exit();
     6b2:	e8 ec 30 00 00       	call   37a3 <exit>

000006b7 <createtest>:

void
createtest(void)
{
     6b7:	55                   	push   %ebp
     6b8:	89 e5                	mov    %esp,%ebp
     6ba:	53                   	push   %ebx
     6bb:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     6be:	68 58 4c 00 00       	push   $0x4c58
     6c3:	ff 35 d4 5c 00 00    	push   0x5cd4
     6c9:	e8 2a 32 00 00       	call   38f8 <printf>

  name[0] = 'a';
     6ce:	c6 05 10 84 00 00 61 	movb   $0x61,0x8410
  name[2] = '\0';
     6d5:	c6 05 12 84 00 00 00 	movb   $0x0,0x8412
  for(i = 0; i < 52; i++){
     6dc:	83 c4 10             	add    $0x10,%esp
     6df:	bb 00 00 00 00       	mov    $0x0,%ebx
     6e4:	eb 28                	jmp    70e <createtest+0x57>
    name[1] = '0' + i;
     6e6:	8d 43 30             	lea    0x30(%ebx),%eax
     6e9:	a2 11 84 00 00       	mov    %al,0x8411
    fd = open(name, O_CREATE|O_RDWR);
     6ee:	83 ec 08             	sub    $0x8,%esp
     6f1:	68 02 02 00 00       	push   $0x202
     6f6:	68 10 84 00 00       	push   $0x8410
     6fb:	e8 e3 30 00 00       	call   37e3 <open>
    close(fd);
     700:	89 04 24             	mov    %eax,(%esp)
     703:	e8 c3 30 00 00       	call   37cb <close>
  for(i = 0; i < 52; i++){
     708:	83 c3 01             	add    $0x1,%ebx
     70b:	83 c4 10             	add    $0x10,%esp
     70e:	83 fb 33             	cmp    $0x33,%ebx
     711:	7e d3                	jle    6e6 <createtest+0x2f>
  }
  name[0] = 'a';
     713:	c6 05 10 84 00 00 61 	movb   $0x61,0x8410
  name[2] = '\0';
     71a:	c6 05 12 84 00 00 00 	movb   $0x0,0x8412
  for(i = 0; i < 52; i++){
     721:	bb 00 00 00 00       	mov    $0x0,%ebx
     726:	eb 1b                	jmp    743 <createtest+0x8c>
    name[1] = '0' + i;
     728:	8d 43 30             	lea    0x30(%ebx),%eax
     72b:	a2 11 84 00 00       	mov    %al,0x8411
    unlink(name);
     730:	83 ec 0c             	sub    $0xc,%esp
     733:	68 10 84 00 00       	push   $0x8410
     738:	e8 b6 30 00 00       	call   37f3 <unlink>
  for(i = 0; i < 52; i++){
     73d:	83 c3 01             	add    $0x1,%ebx
     740:	83 c4 10             	add    $0x10,%esp
     743:	83 fb 33             	cmp    $0x33,%ebx
     746:	7e e0                	jle    728 <createtest+0x71>
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     748:	83 ec 08             	sub    $0x8,%esp
     74b:	68 80 4c 00 00       	push   $0x4c80
     750:	ff 35 d4 5c 00 00    	push   0x5cd4
     756:	e8 9d 31 00 00       	call   38f8 <printf>
}
     75b:	83 c4 10             	add    $0x10,%esp
     75e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     761:	c9                   	leave  
     762:	c3                   	ret    

00000763 <dirtest>:

void dirtest(void)
{
     763:	55                   	push   %ebp
     764:	89 e5                	mov    %esp,%ebp
     766:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     769:	68 6c 3e 00 00       	push   $0x3e6c
     76e:	ff 35 d4 5c 00 00    	push   0x5cd4
     774:	e8 7f 31 00 00       	call   38f8 <printf>

  if(mkdir("dir0") < 0){
     779:	c7 04 24 78 3e 00 00 	movl   $0x3e78,(%esp)
     780:	e8 86 30 00 00       	call   380b <mkdir>
     785:	83 c4 10             	add    $0x10,%esp
     788:	85 c0                	test   %eax,%eax
     78a:	78 54                	js     7e0 <dirtest+0x7d>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     78c:	83 ec 0c             	sub    $0xc,%esp
     78f:	68 78 3e 00 00       	push   $0x3e78
     794:	e8 7a 30 00 00       	call   3813 <chdir>
     799:	83 c4 10             	add    $0x10,%esp
     79c:	85 c0                	test   %eax,%eax
     79e:	78 58                	js     7f8 <dirtest+0x95>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     7a0:	83 ec 0c             	sub    $0xc,%esp
     7a3:	68 1d 44 00 00       	push   $0x441d
     7a8:	e8 66 30 00 00       	call   3813 <chdir>
     7ad:	83 c4 10             	add    $0x10,%esp
     7b0:	85 c0                	test   %eax,%eax
     7b2:	78 5c                	js     810 <dirtest+0xad>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     7b4:	83 ec 0c             	sub    $0xc,%esp
     7b7:	68 78 3e 00 00       	push   $0x3e78
     7bc:	e8 32 30 00 00       	call   37f3 <unlink>
     7c1:	83 c4 10             	add    $0x10,%esp
     7c4:	85 c0                	test   %eax,%eax
     7c6:	78 60                	js     828 <dirtest+0xc5>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     7c8:	83 ec 08             	sub    $0x8,%esp
     7cb:	68 b5 3e 00 00       	push   $0x3eb5
     7d0:	ff 35 d4 5c 00 00    	push   0x5cd4
     7d6:	e8 1d 31 00 00       	call   38f8 <printf>
}
     7db:	83 c4 10             	add    $0x10,%esp
     7de:	c9                   	leave  
     7df:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     7e0:	83 ec 08             	sub    $0x8,%esp
     7e3:	68 a8 3b 00 00       	push   $0x3ba8
     7e8:	ff 35 d4 5c 00 00    	push   0x5cd4
     7ee:	e8 05 31 00 00       	call   38f8 <printf>
    exit();
     7f3:	e8 ab 2f 00 00       	call   37a3 <exit>
    printf(stdout, "chdir dir0 failed\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 7d 3e 00 00       	push   $0x3e7d
     800:	ff 35 d4 5c 00 00    	push   0x5cd4
     806:	e8 ed 30 00 00       	call   38f8 <printf>
    exit();
     80b:	e8 93 2f 00 00       	call   37a3 <exit>
    printf(stdout, "chdir .. failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 90 3e 00 00       	push   $0x3e90
     818:	ff 35 d4 5c 00 00    	push   0x5cd4
     81e:	e8 d5 30 00 00       	call   38f8 <printf>
    exit();
     823:	e8 7b 2f 00 00       	call   37a3 <exit>
    printf(stdout, "unlink dir0 failed\n");
     828:	83 ec 08             	sub    $0x8,%esp
     82b:	68 a1 3e 00 00       	push   $0x3ea1
     830:	ff 35 d4 5c 00 00    	push   0x5cd4
     836:	e8 bd 30 00 00       	call   38f8 <printf>
    exit();
     83b:	e8 63 2f 00 00       	call   37a3 <exit>

00000840 <exectest>:

void
exectest(void)
{
     840:	55                   	push   %ebp
     841:	89 e5                	mov    %esp,%ebp
     843:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     846:	68 c4 3e 00 00       	push   $0x3ec4
     84b:	ff 35 d4 5c 00 00    	push   0x5cd4
     851:	e8 a2 30 00 00       	call   38f8 <printf>
  if(exec("echo", echoargv) < 0){
     856:	83 c4 08             	add    $0x8,%esp
     859:	68 d8 5c 00 00       	push   $0x5cd8
     85e:	68 8d 3c 00 00       	push   $0x3c8d
     863:	e8 73 2f 00 00       	call   37db <exec>
     868:	83 c4 10             	add    $0x10,%esp
     86b:	85 c0                	test   %eax,%eax
     86d:	78 02                	js     871 <exectest+0x31>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     86f:	c9                   	leave  
     870:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     871:	83 ec 08             	sub    $0x8,%esp
     874:	68 cf 3e 00 00       	push   $0x3ecf
     879:	ff 35 d4 5c 00 00    	push   0x5cd4
     87f:	e8 74 30 00 00       	call   38f8 <printf>
    exit();
     884:	e8 1a 2f 00 00       	call   37a3 <exit>

00000889 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     889:	55                   	push   %ebp
     88a:	89 e5                	mov    %esp,%ebp
     88c:	57                   	push   %edi
     88d:	56                   	push   %esi
     88e:	53                   	push   %ebx
     88f:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     892:	8d 45 e0             	lea    -0x20(%ebp),%eax
     895:	50                   	push   %eax
     896:	e8 18 2f 00 00       	call   37b3 <pipe>
     89b:	83 c4 10             	add    $0x10,%esp
     89e:	85 c0                	test   %eax,%eax
     8a0:	75 74                	jne    916 <pipe1+0x8d>
     8a2:	89 c6                	mov    %eax,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     8a4:	e8 f2 2e 00 00       	call   379b <fork>
     8a9:	89 c7                	mov    %eax,%edi
  seq = 0;
  if(pid == 0){
     8ab:	85 c0                	test   %eax,%eax
     8ad:	74 7b                	je     92a <pipe1+0xa1>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     8af:	0f 8e 60 01 00 00    	jle    a15 <pipe1+0x18c>
    close(fds[1]);
     8b5:	83 ec 0c             	sub    $0xc,%esp
     8b8:	ff 75 e4             	push   -0x1c(%ebp)
     8bb:	e8 0b 2f 00 00       	call   37cb <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     8c0:	83 c4 10             	add    $0x10,%esp
    total = 0;
     8c3:	89 75 d0             	mov    %esi,-0x30(%ebp)
  seq = 0;
     8c6:	89 f3                	mov    %esi,%ebx
    cc = 1;
     8c8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     8cf:	83 ec 04             	sub    $0x4,%esp
     8d2:	ff 75 d4             	push   -0x2c(%ebp)
     8d5:	68 20 84 00 00       	push   $0x8420
     8da:	ff 75 e0             	push   -0x20(%ebp)
     8dd:	e8 d9 2e 00 00       	call   37bb <read>
     8e2:	89 c7                	mov    %eax,%edi
     8e4:	83 c4 10             	add    $0x10,%esp
     8e7:	85 c0                	test   %eax,%eax
     8e9:	0f 8e e2 00 00 00    	jle    9d1 <pipe1+0x148>
      for(i = 0; i < n; i++){
     8ef:	89 f0                	mov    %esi,%eax
     8f1:	89 d9                	mov    %ebx,%ecx
     8f3:	39 f8                	cmp    %edi,%eax
     8f5:	0f 8d b4 00 00 00    	jge    9af <pipe1+0x126>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     8fb:	0f be 98 20 84 00 00 	movsbl 0x8420(%eax),%ebx
     902:	8d 51 01             	lea    0x1(%ecx),%edx
     905:	31 cb                	xor    %ecx,%ebx
     907:	84 db                	test   %bl,%bl
     909:	0f 85 86 00 00 00    	jne    995 <pipe1+0x10c>
      for(i = 0; i < n; i++){
     90f:	83 c0 01             	add    $0x1,%eax
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     912:	89 d1                	mov    %edx,%ecx
     914:	eb dd                	jmp    8f3 <pipe1+0x6a>
    printf(1, "pipe() failed\n");
     916:	83 ec 08             	sub    $0x8,%esp
     919:	68 e1 3e 00 00       	push   $0x3ee1
     91e:	6a 01                	push   $0x1
     920:	e8 d3 2f 00 00       	call   38f8 <printf>
    exit();
     925:	e8 79 2e 00 00       	call   37a3 <exit>
    close(fds[0]);
     92a:	83 ec 0c             	sub    $0xc,%esp
     92d:	ff 75 e0             	push   -0x20(%ebp)
     930:	e8 96 2e 00 00       	call   37cb <close>
    for(n = 0; n < 5; n++){
     935:	83 c4 10             	add    $0x10,%esp
     938:	89 fe                	mov    %edi,%esi
  seq = 0;
     93a:	89 fb                	mov    %edi,%ebx
    for(n = 0; n < 5; n++){
     93c:	eb 35                	jmp    973 <pipe1+0xea>
        buf[i] = seq++;
     93e:	88 98 20 84 00 00    	mov    %bl,0x8420(%eax)
      for(i = 0; i < 1033; i++)
     944:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
     947:	8d 5b 01             	lea    0x1(%ebx),%ebx
      for(i = 0; i < 1033; i++)
     94a:	3d 08 04 00 00       	cmp    $0x408,%eax
     94f:	7e ed                	jle    93e <pipe1+0xb5>
      if(write(fds[1], buf, 1033) != 1033){
     951:	83 ec 04             	sub    $0x4,%esp
     954:	68 09 04 00 00       	push   $0x409
     959:	68 20 84 00 00       	push   $0x8420
     95e:	ff 75 e4             	push   -0x1c(%ebp)
     961:	e8 5d 2e 00 00       	call   37c3 <write>
     966:	83 c4 10             	add    $0x10,%esp
     969:	3d 09 04 00 00       	cmp    $0x409,%eax
     96e:	75 0c                	jne    97c <pipe1+0xf3>
    for(n = 0; n < 5; n++){
     970:	83 c6 01             	add    $0x1,%esi
     973:	83 fe 04             	cmp    $0x4,%esi
     976:	7f 18                	jg     990 <pipe1+0x107>
      for(i = 0; i < 1033; i++)
     978:	89 f8                	mov    %edi,%eax
     97a:	eb ce                	jmp    94a <pipe1+0xc1>
        printf(1, "pipe1 oops 1\n");
     97c:	83 ec 08             	sub    $0x8,%esp
     97f:	68 f0 3e 00 00       	push   $0x3ef0
     984:	6a 01                	push   $0x1
     986:	e8 6d 2f 00 00       	call   38f8 <printf>
        exit();
     98b:	e8 13 2e 00 00       	call   37a3 <exit>
    exit();
     990:	e8 0e 2e 00 00       	call   37a3 <exit>
          printf(1, "pipe1 oops 2\n");
     995:	83 ec 08             	sub    $0x8,%esp
     998:	68 fe 3e 00 00       	push   $0x3efe
     99d:	6a 01                	push   $0x1
     99f:	e8 54 2f 00 00       	call   38f8 <printf>
          return;
     9a4:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     9a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9aa:	5b                   	pop    %ebx
     9ab:	5e                   	pop    %esi
     9ac:	5f                   	pop    %edi
     9ad:	5d                   	pop    %ebp
     9ae:	c3                   	ret    
      total += n;
     9af:	89 cb                	mov    %ecx,%ebx
     9b1:	01 7d d0             	add    %edi,-0x30(%ebp)
      cc = cc * 2;
     9b4:	d1 65 d4             	shll   -0x2c(%ebp)
     9b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      if(cc > sizeof(buf))
     9ba:	3d 00 20 00 00       	cmp    $0x2000,%eax
     9bf:	0f 86 0a ff ff ff    	jbe    8cf <pipe1+0x46>
        cc = sizeof(buf);
     9c5:	c7 45 d4 00 20 00 00 	movl   $0x2000,-0x2c(%ebp)
     9cc:	e9 fe fe ff ff       	jmp    8cf <pipe1+0x46>
    if(total != 5 * 1033){
     9d1:	81 7d d0 2d 14 00 00 	cmpl   $0x142d,-0x30(%ebp)
     9d8:	75 24                	jne    9fe <pipe1+0x175>
    close(fds[0]);
     9da:	83 ec 0c             	sub    $0xc,%esp
     9dd:	ff 75 e0             	push   -0x20(%ebp)
     9e0:	e8 e6 2d 00 00       	call   37cb <close>
    wait();
     9e5:	e8 c1 2d 00 00       	call   37ab <wait>
  printf(1, "pipe1 ok\n");
     9ea:	83 c4 08             	add    $0x8,%esp
     9ed:	68 23 3f 00 00       	push   $0x3f23
     9f2:	6a 01                	push   $0x1
     9f4:	e8 ff 2e 00 00       	call   38f8 <printf>
     9f9:	83 c4 10             	add    $0x10,%esp
     9fc:	eb a9                	jmp    9a7 <pipe1+0x11e>
      printf(1, "pipe1 oops 3 total %d\n", total);
     9fe:	83 ec 04             	sub    $0x4,%esp
     a01:	ff 75 d0             	push   -0x30(%ebp)
     a04:	68 0c 3f 00 00       	push   $0x3f0c
     a09:	6a 01                	push   $0x1
     a0b:	e8 e8 2e 00 00       	call   38f8 <printf>
      exit();
     a10:	e8 8e 2d 00 00       	call   37a3 <exit>
    printf(1, "fork() failed\n");
     a15:	83 ec 08             	sub    $0x8,%esp
     a18:	68 2d 3f 00 00       	push   $0x3f2d
     a1d:	6a 01                	push   $0x1
     a1f:	e8 d4 2e 00 00       	call   38f8 <printf>
    exit();
     a24:	e8 7a 2d 00 00       	call   37a3 <exit>

00000a29 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     a29:	55                   	push   %ebp
     a2a:	89 e5                	mov    %esp,%ebp
     a2c:	57                   	push   %edi
     a2d:	56                   	push   %esi
     a2e:	53                   	push   %ebx
     a2f:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     a32:	68 3c 3f 00 00       	push   $0x3f3c
     a37:	6a 01                	push   $0x1
     a39:	e8 ba 2e 00 00       	call   38f8 <printf>
  pid1 = fork();
     a3e:	e8 58 2d 00 00       	call   379b <fork>
  if(pid1 == 0)
     a43:	83 c4 10             	add    $0x10,%esp
     a46:	85 c0                	test   %eax,%eax
     a48:	75 02                	jne    a4c <preempt+0x23>
    for(;;)
     a4a:	eb fe                	jmp    a4a <preempt+0x21>
     a4c:	89 c3                	mov    %eax,%ebx
      ;

  pid2 = fork();
     a4e:	e8 48 2d 00 00       	call   379b <fork>
     a53:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     a55:	85 c0                	test   %eax,%eax
     a57:	75 02                	jne    a5b <preempt+0x32>
    for(;;)
     a59:	eb fe                	jmp    a59 <preempt+0x30>
      ;

  pipe(pfds);
     a5b:	83 ec 0c             	sub    $0xc,%esp
     a5e:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a61:	50                   	push   %eax
     a62:	e8 4c 2d 00 00       	call   37b3 <pipe>
  pid3 = fork();
     a67:	e8 2f 2d 00 00       	call   379b <fork>
     a6c:	89 c7                	mov    %eax,%edi
  if(pid3 == 0){
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	75 49                	jne    abe <preempt+0x95>
    close(pfds[0]);
     a75:	83 ec 0c             	sub    $0xc,%esp
     a78:	ff 75 e0             	push   -0x20(%ebp)
     a7b:	e8 4b 2d 00 00       	call   37cb <close>
    if(write(pfds[1], "x", 1) != 1)
     a80:	83 c4 0c             	add    $0xc,%esp
     a83:	6a 01                	push   $0x1
     a85:	68 01 45 00 00       	push   $0x4501
     a8a:	ff 75 e4             	push   -0x1c(%ebp)
     a8d:	e8 31 2d 00 00       	call   37c3 <write>
     a92:	83 c4 10             	add    $0x10,%esp
     a95:	83 f8 01             	cmp    $0x1,%eax
     a98:	75 10                	jne    aaa <preempt+0x81>
      printf(1, "preempt write error");
    close(pfds[1]);
     a9a:	83 ec 0c             	sub    $0xc,%esp
     a9d:	ff 75 e4             	push   -0x1c(%ebp)
     aa0:	e8 26 2d 00 00       	call   37cb <close>
     aa5:	83 c4 10             	add    $0x10,%esp
    for(;;)
     aa8:	eb fe                	jmp    aa8 <preempt+0x7f>
      printf(1, "preempt write error");
     aaa:	83 ec 08             	sub    $0x8,%esp
     aad:	68 46 3f 00 00       	push   $0x3f46
     ab2:	6a 01                	push   $0x1
     ab4:	e8 3f 2e 00 00       	call   38f8 <printf>
     ab9:	83 c4 10             	add    $0x10,%esp
     abc:	eb dc                	jmp    a9a <preempt+0x71>
      ;
  }

  close(pfds[1]);
     abe:	83 ec 0c             	sub    $0xc,%esp
     ac1:	ff 75 e4             	push   -0x1c(%ebp)
     ac4:	e8 02 2d 00 00       	call   37cb <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     ac9:	83 c4 0c             	add    $0xc,%esp
     acc:	68 00 20 00 00       	push   $0x2000
     ad1:	68 20 84 00 00       	push   $0x8420
     ad6:	ff 75 e0             	push   -0x20(%ebp)
     ad9:	e8 dd 2c 00 00       	call   37bb <read>
     ade:	83 c4 10             	add    $0x10,%esp
     ae1:	83 f8 01             	cmp    $0x1,%eax
     ae4:	74 1a                	je     b00 <preempt+0xd7>
    printf(1, "preempt read error");
     ae6:	83 ec 08             	sub    $0x8,%esp
     ae9:	68 5a 3f 00 00       	push   $0x3f5a
     aee:	6a 01                	push   $0x1
     af0:	e8 03 2e 00 00       	call   38f8 <printf>
    return;
     af5:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     af8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     afb:	5b                   	pop    %ebx
     afc:	5e                   	pop    %esi
     afd:	5f                   	pop    %edi
     afe:	5d                   	pop    %ebp
     aff:	c3                   	ret    
  close(pfds[0]);
     b00:	83 ec 0c             	sub    $0xc,%esp
     b03:	ff 75 e0             	push   -0x20(%ebp)
     b06:	e8 c0 2c 00 00       	call   37cb <close>
  printf(1, "kill... ");
     b0b:	83 c4 08             	add    $0x8,%esp
     b0e:	68 6d 3f 00 00       	push   $0x3f6d
     b13:	6a 01                	push   $0x1
     b15:	e8 de 2d 00 00       	call   38f8 <printf>
  kill(pid1);
     b1a:	89 1c 24             	mov    %ebx,(%esp)
     b1d:	e8 b1 2c 00 00       	call   37d3 <kill>
  kill(pid2);
     b22:	89 34 24             	mov    %esi,(%esp)
     b25:	e8 a9 2c 00 00       	call   37d3 <kill>
  kill(pid3);
     b2a:	89 3c 24             	mov    %edi,(%esp)
     b2d:	e8 a1 2c 00 00       	call   37d3 <kill>
  printf(1, "wait... ");
     b32:	83 c4 08             	add    $0x8,%esp
     b35:	68 76 3f 00 00       	push   $0x3f76
     b3a:	6a 01                	push   $0x1
     b3c:	e8 b7 2d 00 00       	call   38f8 <printf>
  wait();
     b41:	e8 65 2c 00 00       	call   37ab <wait>
  wait();
     b46:	e8 60 2c 00 00       	call   37ab <wait>
  wait();
     b4b:	e8 5b 2c 00 00       	call   37ab <wait>
  printf(1, "preempt ok\n");
     b50:	83 c4 08             	add    $0x8,%esp
     b53:	68 7f 3f 00 00       	push   $0x3f7f
     b58:	6a 01                	push   $0x1
     b5a:	e8 99 2d 00 00       	call   38f8 <printf>
     b5f:	83 c4 10             	add    $0x10,%esp
     b62:	eb 94                	jmp    af8 <preempt+0xcf>

00000b64 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     b64:	55                   	push   %ebp
     b65:	89 e5                	mov    %esp,%ebp
     b67:	56                   	push   %esi
     b68:	53                   	push   %ebx
  int i, pid;

  for(i = 0; i < 100; i++){
     b69:	be 00 00 00 00       	mov    $0x0,%esi
     b6e:	83 fe 63             	cmp    $0x63,%esi
     b71:	7f 4d                	jg     bc0 <exitwait+0x5c>
    pid = fork();
     b73:	e8 23 2c 00 00       	call   379b <fork>
     b78:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     b7a:	85 c0                	test   %eax,%eax
     b7c:	78 10                	js     b8e <exitwait+0x2a>
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     b7e:	74 3b                	je     bbb <exitwait+0x57>
      if(wait() != pid){
     b80:	e8 26 2c 00 00       	call   37ab <wait>
     b85:	39 d8                	cmp    %ebx,%eax
     b87:	75 1e                	jne    ba7 <exitwait+0x43>
  for(i = 0; i < 100; i++){
     b89:	83 c6 01             	add    $0x1,%esi
     b8c:	eb e0                	jmp    b6e <exitwait+0xa>
      printf(1, "fork failed\n");
     b8e:	83 ec 08             	sub    $0x8,%esp
     b91:	68 e9 4a 00 00       	push   $0x4ae9
     b96:	6a 01                	push   $0x1
     b98:	e8 5b 2d 00 00       	call   38f8 <printf>
      return;
     b9d:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     ba0:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ba3:	5b                   	pop    %ebx
     ba4:	5e                   	pop    %esi
     ba5:	5d                   	pop    %ebp
     ba6:	c3                   	ret    
        printf(1, "wait wrong pid\n");
     ba7:	83 ec 08             	sub    $0x8,%esp
     baa:	68 8b 3f 00 00       	push   $0x3f8b
     baf:	6a 01                	push   $0x1
     bb1:	e8 42 2d 00 00       	call   38f8 <printf>
        return;
     bb6:	83 c4 10             	add    $0x10,%esp
     bb9:	eb e5                	jmp    ba0 <exitwait+0x3c>
      exit();
     bbb:	e8 e3 2b 00 00       	call   37a3 <exit>
  printf(1, "exitwait ok\n");
     bc0:	83 ec 08             	sub    $0x8,%esp
     bc3:	68 9b 3f 00 00       	push   $0x3f9b
     bc8:	6a 01                	push   $0x1
     bca:	e8 29 2d 00 00       	call   38f8 <printf>
     bcf:	83 c4 10             	add    $0x10,%esp
     bd2:	eb cc                	jmp    ba0 <exitwait+0x3c>

00000bd4 <mem>:

void
mem(void)
{
     bd4:	55                   	push   %ebp
     bd5:	89 e5                	mov    %esp,%ebp
     bd7:	57                   	push   %edi
     bd8:	56                   	push   %esi
     bd9:	53                   	push   %ebx
     bda:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     bdd:	68 a8 3f 00 00       	push   $0x3fa8
     be2:	6a 01                	push   $0x1
     be4:	e8 0f 2d 00 00       	call   38f8 <printf>
  ppid = getpid();
     be9:	e8 35 2c 00 00       	call   3823 <getpid>
     bee:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     bf0:	e8 a6 2b 00 00       	call   379b <fork>
     bf5:	83 c4 10             	add    $0x10,%esp
     bf8:	85 c0                	test   %eax,%eax
     bfa:	0f 85 82 00 00 00    	jne    c82 <mem+0xae>
    m1 = 0;
     c00:	bb 00 00 00 00       	mov    $0x0,%ebx
     c05:	eb 04                	jmp    c0b <mem+0x37>
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     c07:	89 18                	mov    %ebx,(%eax)
      m1 = m2;
     c09:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
     c0b:	83 ec 0c             	sub    $0xc,%esp
     c0e:	68 11 27 00 00       	push   $0x2711
     c13:	e8 06 2f 00 00       	call   3b1e <malloc>
     c18:	83 c4 10             	add    $0x10,%esp
     c1b:	85 c0                	test   %eax,%eax
     c1d:	75 e8                	jne    c07 <mem+0x33>
     c1f:	eb 10                	jmp    c31 <mem+0x5d>
    }
    while(m1){
      m2 = *(char**)m1;
     c21:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     c23:	83 ec 0c             	sub    $0xc,%esp
     c26:	53                   	push   %ebx
     c27:	e8 32 2e 00 00       	call   3a5e <free>
     c2c:	83 c4 10             	add    $0x10,%esp
      m1 = m2;
     c2f:	89 fb                	mov    %edi,%ebx
    while(m1){
     c31:	85 db                	test   %ebx,%ebx
     c33:	75 ec                	jne    c21 <mem+0x4d>
    }
    m1 = malloc(1024*20);
     c35:	83 ec 0c             	sub    $0xc,%esp
     c38:	68 00 50 00 00       	push   $0x5000
     c3d:	e8 dc 2e 00 00       	call   3b1e <malloc>
    if(m1 == 0){
     c42:	83 c4 10             	add    $0x10,%esp
     c45:	85 c0                	test   %eax,%eax
     c47:	74 1d                	je     c66 <mem+0x92>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     c49:	83 ec 0c             	sub    $0xc,%esp
     c4c:	50                   	push   %eax
     c4d:	e8 0c 2e 00 00       	call   3a5e <free>
    printf(1, "mem ok\n");
     c52:	83 c4 08             	add    $0x8,%esp
     c55:	68 cc 3f 00 00       	push   $0x3fcc
     c5a:	6a 01                	push   $0x1
     c5c:	e8 97 2c 00 00       	call   38f8 <printf>
    exit();
     c61:	e8 3d 2b 00 00       	call   37a3 <exit>
      printf(1, "couldn't allocate mem?!!\n");
     c66:	83 ec 08             	sub    $0x8,%esp
     c69:	68 b2 3f 00 00       	push   $0x3fb2
     c6e:	6a 01                	push   $0x1
     c70:	e8 83 2c 00 00       	call   38f8 <printf>
      kill(ppid);
     c75:	89 34 24             	mov    %esi,(%esp)
     c78:	e8 56 2b 00 00       	call   37d3 <kill>
      exit();
     c7d:	e8 21 2b 00 00       	call   37a3 <exit>
  } else {
    wait();
     c82:	e8 24 2b 00 00       	call   37ab <wait>
  }
}
     c87:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c8a:	5b                   	pop    %ebx
     c8b:	5e                   	pop    %esi
     c8c:	5f                   	pop    %edi
     c8d:	5d                   	pop    %ebp
     c8e:	c3                   	ret    

00000c8f <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     c8f:	55                   	push   %ebp
     c90:	89 e5                	mov    %esp,%ebp
     c92:	57                   	push   %edi
     c93:	56                   	push   %esi
     c94:	53                   	push   %ebx
     c95:	83 ec 24             	sub    $0x24,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     c98:	68 d4 3f 00 00       	push   $0x3fd4
     c9d:	6a 01                	push   $0x1
     c9f:	e8 54 2c 00 00       	call   38f8 <printf>

  unlink("sharedfd");
     ca4:	c7 04 24 e3 3f 00 00 	movl   $0x3fe3,(%esp)
     cab:	e8 43 2b 00 00       	call   37f3 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     cb0:	83 c4 08             	add    $0x8,%esp
     cb3:	68 02 02 00 00       	push   $0x202
     cb8:	68 e3 3f 00 00       	push   $0x3fe3
     cbd:	e8 21 2b 00 00       	call   37e3 <open>
  if(fd < 0){
     cc2:	83 c4 10             	add    $0x10,%esp
     cc5:	85 c0                	test   %eax,%eax
     cc7:	78 4d                	js     d16 <sharedfd+0x87>
     cc9:	89 c6                	mov    %eax,%esi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     ccb:	e8 cb 2a 00 00       	call   379b <fork>
     cd0:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     cd2:	85 c0                	test   %eax,%eax
     cd4:	75 57                	jne    d2d <sharedfd+0x9e>
     cd6:	b8 63 00 00 00       	mov    $0x63,%eax
     cdb:	83 ec 04             	sub    $0x4,%esp
     cde:	6a 0a                	push   $0xa
     ce0:	50                   	push   %eax
     ce1:	8d 45 de             	lea    -0x22(%ebp),%eax
     ce4:	50                   	push   %eax
     ce5:	e8 f3 28 00 00       	call   35dd <memset>
  for(i = 0; i < 1000; i++){
     cea:	83 c4 10             	add    $0x10,%esp
     ced:	bb 00 00 00 00       	mov    $0x0,%ebx
     cf2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
     cf8:	7f 4c                	jg     d46 <sharedfd+0xb7>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     cfa:	83 ec 04             	sub    $0x4,%esp
     cfd:	6a 0a                	push   $0xa
     cff:	8d 45 de             	lea    -0x22(%ebp),%eax
     d02:	50                   	push   %eax
     d03:	56                   	push   %esi
     d04:	e8 ba 2a 00 00       	call   37c3 <write>
     d09:	83 c4 10             	add    $0x10,%esp
     d0c:	83 f8 0a             	cmp    $0xa,%eax
     d0f:	75 23                	jne    d34 <sharedfd+0xa5>
  for(i = 0; i < 1000; i++){
     d11:	83 c3 01             	add    $0x1,%ebx
     d14:	eb dc                	jmp    cf2 <sharedfd+0x63>
    printf(1, "fstests: cannot open sharedfd for writing");
     d16:	83 ec 08             	sub    $0x8,%esp
     d19:	68 a8 4c 00 00       	push   $0x4ca8
     d1e:	6a 01                	push   $0x1
     d20:	e8 d3 2b 00 00       	call   38f8 <printf>
    return;
     d25:	83 c4 10             	add    $0x10,%esp
     d28:	e9 e4 00 00 00       	jmp    e11 <sharedfd+0x182>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     d2d:	b8 70 00 00 00       	mov    $0x70,%eax
     d32:	eb a7                	jmp    cdb <sharedfd+0x4c>
      printf(1, "fstests: write sharedfd failed\n");
     d34:	83 ec 08             	sub    $0x8,%esp
     d37:	68 d4 4c 00 00       	push   $0x4cd4
     d3c:	6a 01                	push   $0x1
     d3e:	e8 b5 2b 00 00       	call   38f8 <printf>
      break;
     d43:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     d46:	85 ff                	test   %edi,%edi
     d48:	74 4d                	je     d97 <sharedfd+0x108>
    exit();
  else
    wait();
     d4a:	e8 5c 2a 00 00       	call   37ab <wait>
  close(fd);
     d4f:	83 ec 0c             	sub    $0xc,%esp
     d52:	56                   	push   %esi
     d53:	e8 73 2a 00 00       	call   37cb <close>
  fd = open("sharedfd", 0);
     d58:	83 c4 08             	add    $0x8,%esp
     d5b:	6a 00                	push   $0x0
     d5d:	68 e3 3f 00 00       	push   $0x3fe3
     d62:	e8 7c 2a 00 00       	call   37e3 <open>
     d67:	89 c7                	mov    %eax,%edi
  if(fd < 0){
     d69:	83 c4 10             	add    $0x10,%esp
     d6c:	85 c0                	test   %eax,%eax
     d6e:	78 2c                	js     d9c <sharedfd+0x10d>
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
     d70:	be 00 00 00 00       	mov    $0x0,%esi
     d75:	bb 00 00 00 00       	mov    $0x0,%ebx
  while((n = read(fd, buf, sizeof(buf))) > 0){
     d7a:	83 ec 04             	sub    $0x4,%esp
     d7d:	6a 0a                	push   $0xa
     d7f:	8d 45 de             	lea    -0x22(%ebp),%eax
     d82:	50                   	push   %eax
     d83:	57                   	push   %edi
     d84:	e8 32 2a 00 00       	call   37bb <read>
     d89:	83 c4 10             	add    $0x10,%esp
     d8c:	85 c0                	test   %eax,%eax
     d8e:	7e 41                	jle    dd1 <sharedfd+0x142>
    for(i = 0; i < sizeof(buf); i++){
     d90:	b8 00 00 00 00       	mov    $0x0,%eax
     d95:	eb 21                	jmp    db8 <sharedfd+0x129>
    exit();
     d97:	e8 07 2a 00 00       	call   37a3 <exit>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     d9c:	83 ec 08             	sub    $0x8,%esp
     d9f:	68 f4 4c 00 00       	push   $0x4cf4
     da4:	6a 01                	push   $0x1
     da6:	e8 4d 2b 00 00       	call   38f8 <printf>
    return;
     dab:	83 c4 10             	add    $0x10,%esp
     dae:	eb 61                	jmp    e11 <sharedfd+0x182>
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
     db0:	80 fa 70             	cmp    $0x70,%dl
     db3:	74 17                	je     dcc <sharedfd+0x13d>
    for(i = 0; i < sizeof(buf); i++){
     db5:	83 c0 01             	add    $0x1,%eax
     db8:	83 f8 09             	cmp    $0x9,%eax
     dbb:	77 bd                	ja     d7a <sharedfd+0xeb>
      if(buf[i] == 'c')
     dbd:	0f b6 54 05 de       	movzbl -0x22(%ebp,%eax,1),%edx
     dc2:	80 fa 63             	cmp    $0x63,%dl
     dc5:	75 e9                	jne    db0 <sharedfd+0x121>
        nc++;
     dc7:	83 c3 01             	add    $0x1,%ebx
     dca:	eb e4                	jmp    db0 <sharedfd+0x121>
        np++;
     dcc:	83 c6 01             	add    $0x1,%esi
     dcf:	eb e4                	jmp    db5 <sharedfd+0x126>
    }
  }
  close(fd);
     dd1:	83 ec 0c             	sub    $0xc,%esp
     dd4:	57                   	push   %edi
     dd5:	e8 f1 29 00 00       	call   37cb <close>
  unlink("sharedfd");
     dda:	c7 04 24 e3 3f 00 00 	movl   $0x3fe3,(%esp)
     de1:	e8 0d 2a 00 00       	call   37f3 <unlink>
  if(nc == 10000 && np == 10000){
     de6:	83 c4 10             	add    $0x10,%esp
     de9:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     def:	0f 94 c2             	sete   %dl
     df2:	81 fe 10 27 00 00    	cmp    $0x2710,%esi
     df8:	0f 94 c0             	sete   %al
     dfb:	84 c2                	test   %al,%dl
     dfd:	74 1a                	je     e19 <sharedfd+0x18a>
    printf(1, "sharedfd ok\n");
     dff:	83 ec 08             	sub    $0x8,%esp
     e02:	68 ec 3f 00 00       	push   $0x3fec
     e07:	6a 01                	push   $0x1
     e09:	e8 ea 2a 00 00       	call   38f8 <printf>
     e0e:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     e11:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e14:	5b                   	pop    %ebx
     e15:	5e                   	pop    %esi
     e16:	5f                   	pop    %edi
     e17:	5d                   	pop    %ebp
     e18:	c3                   	ret    
    printf(1, "sharedfd oops %d %d\n", nc, np);
     e19:	56                   	push   %esi
     e1a:	53                   	push   %ebx
     e1b:	68 f9 3f 00 00       	push   $0x3ff9
     e20:	6a 01                	push   $0x1
     e22:	e8 d1 2a 00 00       	call   38f8 <printf>
    exit();
     e27:	e8 77 29 00 00       	call   37a3 <exit>

00000e2c <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
     e2c:	55                   	push   %ebp
     e2d:	89 e5                	mov    %esp,%ebp
     e2f:	57                   	push   %edi
     e30:	56                   	push   %esi
     e31:	53                   	push   %ebx
     e32:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
     e35:	c7 45 d8 0e 40 00 00 	movl   $0x400e,-0x28(%ebp)
     e3c:	c7 45 dc 57 41 00 00 	movl   $0x4157,-0x24(%ebp)
     e43:	c7 45 e0 5b 41 00 00 	movl   $0x415b,-0x20(%ebp)
     e4a:	c7 45 e4 11 40 00 00 	movl   $0x4011,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
     e51:	68 14 40 00 00       	push   $0x4014
     e56:	6a 01                	push   $0x1
     e58:	e8 9b 2a 00 00       	call   38f8 <printf>

  for(pi = 0; pi < 4; pi++){
     e5d:	83 c4 10             	add    $0x10,%esp
     e60:	be 00 00 00 00       	mov    $0x0,%esi
     e65:	eb 45                	jmp    eac <fourfiles+0x80>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
     e67:	83 ec 08             	sub    $0x8,%esp
     e6a:	68 e9 4a 00 00       	push   $0x4ae9
     e6f:	6a 01                	push   $0x1
     e71:	e8 82 2a 00 00       	call   38f8 <printf>
      exit();
     e76:	e8 28 29 00 00       	call   37a3 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
     e7b:	83 ec 08             	sub    $0x8,%esp
     e7e:	68 af 42 00 00       	push   $0x42af
     e83:	6a 01                	push   $0x1
     e85:	e8 6e 2a 00 00       	call   38f8 <printf>
        exit();
     e8a:	e8 14 29 00 00       	call   37a3 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
     e8f:	83 ec 04             	sub    $0x4,%esp
     e92:	50                   	push   %eax
     e93:	68 24 40 00 00       	push   $0x4024
     e98:	6a 01                	push   $0x1
     e9a:	e8 59 2a 00 00       	call   38f8 <printf>
          exit();
     e9f:	e8 ff 28 00 00       	call   37a3 <exit>
        }
      }
      exit();
     ea4:	e8 fa 28 00 00       	call   37a3 <exit>
  for(pi = 0; pi < 4; pi++){
     ea9:	83 c6 01             	add    $0x1,%esi
     eac:	83 fe 03             	cmp    $0x3,%esi
     eaf:	7f 78                	jg     f29 <fourfiles+0xfd>
    fname = names[pi];
     eb1:	8b 7c b5 d8          	mov    -0x28(%ebp,%esi,4),%edi
    unlink(fname);
     eb5:	83 ec 0c             	sub    $0xc,%esp
     eb8:	57                   	push   %edi
     eb9:	e8 35 29 00 00       	call   37f3 <unlink>
    pid = fork();
     ebe:	e8 d8 28 00 00       	call   379b <fork>
    if(pid < 0){
     ec3:	83 c4 10             	add    $0x10,%esp
     ec6:	85 c0                	test   %eax,%eax
     ec8:	78 9d                	js     e67 <fourfiles+0x3b>
    if(pid == 0){
     eca:	75 dd                	jne    ea9 <fourfiles+0x7d>
      fd = open(fname, O_CREATE | O_RDWR);
     ecc:	89 c3                	mov    %eax,%ebx
     ece:	83 ec 08             	sub    $0x8,%esp
     ed1:	68 02 02 00 00       	push   $0x202
     ed6:	57                   	push   %edi
     ed7:	e8 07 29 00 00       	call   37e3 <open>
     edc:	89 c7                	mov    %eax,%edi
      if(fd < 0){
     ede:	83 c4 10             	add    $0x10,%esp
     ee1:	85 c0                	test   %eax,%eax
     ee3:	78 96                	js     e7b <fourfiles+0x4f>
      memset(buf, '0'+pi, 512);
     ee5:	83 ec 04             	sub    $0x4,%esp
     ee8:	68 00 02 00 00       	push   $0x200
     eed:	83 c6 30             	add    $0x30,%esi
     ef0:	56                   	push   %esi
     ef1:	68 20 84 00 00       	push   $0x8420
     ef6:	e8 e2 26 00 00       	call   35dd <memset>
      for(i = 0; i < 12; i++){
     efb:	83 c4 10             	add    $0x10,%esp
     efe:	83 fb 0b             	cmp    $0xb,%ebx
     f01:	7f a1                	jg     ea4 <fourfiles+0x78>
        if((n = write(fd, buf, 500)) != 500){
     f03:	83 ec 04             	sub    $0x4,%esp
     f06:	68 f4 01 00 00       	push   $0x1f4
     f0b:	68 20 84 00 00       	push   $0x8420
     f10:	57                   	push   %edi
     f11:	e8 ad 28 00 00       	call   37c3 <write>
     f16:	83 c4 10             	add    $0x10,%esp
     f19:	3d f4 01 00 00       	cmp    $0x1f4,%eax
     f1e:	0f 85 6b ff ff ff    	jne    e8f <fourfiles+0x63>
      for(i = 0; i < 12; i++){
     f24:	83 c3 01             	add    $0x1,%ebx
     f27:	eb d5                	jmp    efe <fourfiles+0xd2>
    }
  }

  for(pi = 0; pi < 4; pi++){
     f29:	bb 00 00 00 00       	mov    $0x0,%ebx
     f2e:	eb 08                	jmp    f38 <fourfiles+0x10c>
    wait();
     f30:	e8 76 28 00 00       	call   37ab <wait>
  for(pi = 0; pi < 4; pi++){
     f35:	83 c3 01             	add    $0x1,%ebx
     f38:	83 fb 03             	cmp    $0x3,%ebx
     f3b:	7e f3                	jle    f30 <fourfiles+0x104>
  }

  for(i = 0; i < 2; i++){
     f3d:	bb 00 00 00 00       	mov    $0x0,%ebx
     f42:	eb 75                	jmp    fb9 <fourfiles+0x18d>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
     f44:	83 ec 08             	sub    $0x8,%esp
     f47:	68 35 40 00 00       	push   $0x4035
     f4c:	6a 01                	push   $0x1
     f4e:	e8 a5 29 00 00       	call   38f8 <printf>
          exit();
     f53:	e8 4b 28 00 00       	call   37a3 <exit>
        }
      }
      total += n;
     f58:	01 7d d4             	add    %edi,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f5b:	83 ec 04             	sub    $0x4,%esp
     f5e:	68 00 20 00 00       	push   $0x2000
     f63:	68 20 84 00 00       	push   $0x8420
     f68:	56                   	push   %esi
     f69:	e8 4d 28 00 00       	call   37bb <read>
     f6e:	89 c7                	mov    %eax,%edi
     f70:	83 c4 10             	add    $0x10,%esp
     f73:	85 c0                	test   %eax,%eax
     f75:	7e 1c                	jle    f93 <fourfiles+0x167>
      for(j = 0; j < n; j++){
     f77:	b8 00 00 00 00       	mov    $0x0,%eax
     f7c:	39 f8                	cmp    %edi,%eax
     f7e:	7d d8                	jge    f58 <fourfiles+0x12c>
        if(buf[j] != '0'+i){
     f80:	0f be 88 20 84 00 00 	movsbl 0x8420(%eax),%ecx
     f87:	8d 53 30             	lea    0x30(%ebx),%edx
     f8a:	39 d1                	cmp    %edx,%ecx
     f8c:	75 b6                	jne    f44 <fourfiles+0x118>
      for(j = 0; j < n; j++){
     f8e:	83 c0 01             	add    $0x1,%eax
     f91:	eb e9                	jmp    f7c <fourfiles+0x150>
    }
    close(fd);
     f93:	83 ec 0c             	sub    $0xc,%esp
     f96:	56                   	push   %esi
     f97:	e8 2f 28 00 00       	call   37cb <close>
    if(total != 12*500){
     f9c:	83 c4 10             	add    $0x10,%esp
     f9f:	81 7d d4 70 17 00 00 	cmpl   $0x1770,-0x2c(%ebp)
     fa6:	75 39                	jne    fe1 <fourfiles+0x1b5>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
     fa8:	83 ec 0c             	sub    $0xc,%esp
     fab:	ff 75 d0             	push   -0x30(%ebp)
     fae:	e8 40 28 00 00       	call   37f3 <unlink>
  for(i = 0; i < 2; i++){
     fb3:	83 c3 01             	add    $0x1,%ebx
     fb6:	83 c4 10             	add    $0x10,%esp
     fb9:	83 fb 01             	cmp    $0x1,%ebx
     fbc:	7f 3a                	jg     ff8 <fourfiles+0x1cc>
    fname = names[i];
     fbe:	8b 44 9d d8          	mov    -0x28(%ebp,%ebx,4),%eax
     fc2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    fd = open(fname, 0);
     fc5:	83 ec 08             	sub    $0x8,%esp
     fc8:	6a 00                	push   $0x0
     fca:	50                   	push   %eax
     fcb:	e8 13 28 00 00       	call   37e3 <open>
     fd0:	89 c6                	mov    %eax,%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fd2:	83 c4 10             	add    $0x10,%esp
    total = 0;
     fd5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fdc:	e9 7a ff ff ff       	jmp    f5b <fourfiles+0x12f>
      printf(1, "wrong length %d\n", total);
     fe1:	83 ec 04             	sub    $0x4,%esp
     fe4:	ff 75 d4             	push   -0x2c(%ebp)
     fe7:	68 41 40 00 00       	push   $0x4041
     fec:	6a 01                	push   $0x1
     fee:	e8 05 29 00 00       	call   38f8 <printf>
      exit();
     ff3:	e8 ab 27 00 00       	call   37a3 <exit>
  }

  printf(1, "fourfiles ok\n");
     ff8:	83 ec 08             	sub    $0x8,%esp
     ffb:	68 52 40 00 00       	push   $0x4052
    1000:	6a 01                	push   $0x1
    1002:	e8 f1 28 00 00       	call   38f8 <printf>
}
    1007:	83 c4 10             	add    $0x10,%esp
    100a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    100d:	5b                   	pop    %ebx
    100e:	5e                   	pop    %esi
    100f:	5f                   	pop    %edi
    1010:	5d                   	pop    %ebp
    1011:	c3                   	ret    

00001012 <createdelete>:

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1012:	55                   	push   %ebp
    1013:	89 e5                	mov    %esp,%ebp
    1015:	56                   	push   %esi
    1016:	53                   	push   %ebx
    1017:	83 ec 28             	sub    $0x28,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    101a:	68 60 40 00 00       	push   $0x4060
    101f:	6a 01                	push   $0x1
    1021:	e8 d2 28 00 00       	call   38f8 <printf>

  for(pi = 0; pi < 4; pi++){
    1026:	83 c4 10             	add    $0x10,%esp
    1029:	be 00 00 00 00       	mov    $0x0,%esi
    102e:	83 fe 03             	cmp    $0x3,%esi
    1031:	0f 8f bc 00 00 00    	jg     10f3 <createdelete+0xe1>
    pid = fork();
    1037:	e8 5f 27 00 00       	call   379b <fork>
    103c:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    103e:	85 c0                	test   %eax,%eax
    1040:	78 07                	js     1049 <createdelete+0x37>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1042:	74 19                	je     105d <createdelete+0x4b>
  for(pi = 0; pi < 4; pi++){
    1044:	83 c6 01             	add    $0x1,%esi
    1047:	eb e5                	jmp    102e <createdelete+0x1c>
      printf(1, "fork failed\n");
    1049:	83 ec 08             	sub    $0x8,%esp
    104c:	68 e9 4a 00 00       	push   $0x4ae9
    1051:	6a 01                	push   $0x1
    1053:	e8 a0 28 00 00       	call   38f8 <printf>
      exit();
    1058:	e8 46 27 00 00       	call   37a3 <exit>
      name[0] = 'p' + pi;
    105d:	8d 46 70             	lea    0x70(%esi),%eax
    1060:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[2] = '\0';
    1063:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
      for(i = 0; i < N; i++){
    1067:	eb 17                	jmp    1080 <createdelete+0x6e>
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    1069:	83 ec 08             	sub    $0x8,%esp
    106c:	68 af 42 00 00       	push   $0x42af
    1071:	6a 01                	push   $0x1
    1073:	e8 80 28 00 00       	call   38f8 <printf>
          exit();
    1078:	e8 26 27 00 00       	call   37a3 <exit>
      for(i = 0; i < N; i++){
    107d:	83 c3 01             	add    $0x1,%ebx
    1080:	83 fb 13             	cmp    $0x13,%ebx
    1083:	7f 69                	jg     10ee <createdelete+0xdc>
        name[1] = '0' + i;
    1085:	8d 43 30             	lea    0x30(%ebx),%eax
    1088:	88 45 d9             	mov    %al,-0x27(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    108b:	83 ec 08             	sub    $0x8,%esp
    108e:	68 02 02 00 00       	push   $0x202
    1093:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1096:	50                   	push   %eax
    1097:	e8 47 27 00 00       	call   37e3 <open>
        if(fd < 0){
    109c:	83 c4 10             	add    $0x10,%esp
    109f:	85 c0                	test   %eax,%eax
    10a1:	78 c6                	js     1069 <createdelete+0x57>
        }
        close(fd);
    10a3:	83 ec 0c             	sub    $0xc,%esp
    10a6:	50                   	push   %eax
    10a7:	e8 1f 27 00 00       	call   37cb <close>
        if(i > 0 && (i % 2 ) == 0){
    10ac:	83 c4 10             	add    $0x10,%esp
    10af:	85 db                	test   %ebx,%ebx
    10b1:	7e ca                	jle    107d <createdelete+0x6b>
    10b3:	f6 c3 01             	test   $0x1,%bl
    10b6:	75 c5                	jne    107d <createdelete+0x6b>
          name[1] = '0' + (i / 2);
    10b8:	89 d8                	mov    %ebx,%eax
    10ba:	c1 e8 1f             	shr    $0x1f,%eax
    10bd:	01 d8                	add    %ebx,%eax
    10bf:	d1 f8                	sar    %eax
    10c1:	83 c0 30             	add    $0x30,%eax
    10c4:	88 45 d9             	mov    %al,-0x27(%ebp)
          if(unlink(name) < 0){
    10c7:	83 ec 0c             	sub    $0xc,%esp
    10ca:	8d 45 d8             	lea    -0x28(%ebp),%eax
    10cd:	50                   	push   %eax
    10ce:	e8 20 27 00 00       	call   37f3 <unlink>
    10d3:	83 c4 10             	add    $0x10,%esp
    10d6:	85 c0                	test   %eax,%eax
    10d8:	79 a3                	jns    107d <createdelete+0x6b>
            printf(1, "unlink failed\n");
    10da:	83 ec 08             	sub    $0x8,%esp
    10dd:	68 61 3c 00 00       	push   $0x3c61
    10e2:	6a 01                	push   $0x1
    10e4:	e8 0f 28 00 00       	call   38f8 <printf>
            exit();
    10e9:	e8 b5 26 00 00       	call   37a3 <exit>
          }
        }
      }
      exit();
    10ee:	e8 b0 26 00 00       	call   37a3 <exit>
    }
  }

  for(pi = 0; pi < 4; pi++){
    10f3:	bb 00 00 00 00       	mov    $0x0,%ebx
    10f8:	eb 08                	jmp    1102 <createdelete+0xf0>
    wait();
    10fa:	e8 ac 26 00 00       	call   37ab <wait>
  for(pi = 0; pi < 4; pi++){
    10ff:	83 c3 01             	add    $0x1,%ebx
    1102:	83 fb 03             	cmp    $0x3,%ebx
    1105:	7e f3                	jle    10fa <createdelete+0xe8>
  }

  name[0] = name[1] = name[2] = 0;
    1107:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    110b:	c6 45 d9 00          	movb   $0x0,-0x27(%ebp)
    110f:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
  for(i = 0; i < N; i++){
    1113:	bb 00 00 00 00       	mov    $0x0,%ebx
    1118:	e9 89 00 00 00       	jmp    11a6 <createdelete+0x194>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    111d:	8d 53 ff             	lea    -0x1(%ebx),%edx
    1120:	83 fa 08             	cmp    $0x8,%edx
    1123:	76 54                	jbe    1179 <createdelete+0x167>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    1125:	85 c0                	test   %eax,%eax
    1127:	79 6c                	jns    1195 <createdelete+0x183>
    for(pi = 0; pi < 4; pi++){
    1129:	83 c6 01             	add    $0x1,%esi
    112c:	83 fe 03             	cmp    $0x3,%esi
    112f:	7f 72                	jg     11a3 <createdelete+0x191>
      name[0] = 'p' + pi;
    1131:	8d 46 70             	lea    0x70(%esi),%eax
    1134:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[1] = '0' + i;
    1137:	8d 43 30             	lea    0x30(%ebx),%eax
    113a:	88 45 d9             	mov    %al,-0x27(%ebp)
      fd = open(name, 0);
    113d:	83 ec 08             	sub    $0x8,%esp
    1140:	6a 00                	push   $0x0
    1142:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1145:	50                   	push   %eax
    1146:	e8 98 26 00 00       	call   37e3 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    114b:	83 c4 10             	add    $0x10,%esp
    114e:	85 db                	test   %ebx,%ebx
    1150:	0f 94 c2             	sete   %dl
    1153:	83 fb 09             	cmp    $0x9,%ebx
    1156:	0f 9f c1             	setg   %cl
    1159:	08 ca                	or     %cl,%dl
    115b:	74 c0                	je     111d <createdelete+0x10b>
    115d:	85 c0                	test   %eax,%eax
    115f:	79 bc                	jns    111d <createdelete+0x10b>
        printf(1, "oops createdelete %s didn't exist\n", name);
    1161:	83 ec 04             	sub    $0x4,%esp
    1164:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1167:	50                   	push   %eax
    1168:	68 20 4d 00 00       	push   $0x4d20
    116d:	6a 01                	push   $0x1
    116f:	e8 84 27 00 00       	call   38f8 <printf>
        exit();
    1174:	e8 2a 26 00 00       	call   37a3 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1179:	85 c0                	test   %eax,%eax
    117b:	78 a8                	js     1125 <createdelete+0x113>
        printf(1, "oops createdelete %s did exist\n", name);
    117d:	83 ec 04             	sub    $0x4,%esp
    1180:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1183:	50                   	push   %eax
    1184:	68 44 4d 00 00       	push   $0x4d44
    1189:	6a 01                	push   $0x1
    118b:	e8 68 27 00 00       	call   38f8 <printf>
        exit();
    1190:	e8 0e 26 00 00       	call   37a3 <exit>
        close(fd);
    1195:	83 ec 0c             	sub    $0xc,%esp
    1198:	50                   	push   %eax
    1199:	e8 2d 26 00 00       	call   37cb <close>
    119e:	83 c4 10             	add    $0x10,%esp
    11a1:	eb 86                	jmp    1129 <createdelete+0x117>
  for(i = 0; i < N; i++){
    11a3:	83 c3 01             	add    $0x1,%ebx
    11a6:	83 fb 13             	cmp    $0x13,%ebx
    11a9:	7f 0a                	jg     11b5 <createdelete+0x1a3>
    for(pi = 0; pi < 4; pi++){
    11ab:	be 00 00 00 00       	mov    $0x0,%esi
    11b0:	e9 77 ff ff ff       	jmp    112c <createdelete+0x11a>
    }
  }

  for(i = 0; i < N; i++){
    11b5:	be 00 00 00 00       	mov    $0x0,%esi
    11ba:	eb 26                	jmp    11e2 <createdelete+0x1d0>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    11bc:	8d 46 70             	lea    0x70(%esi),%eax
    11bf:	88 45 d8             	mov    %al,-0x28(%ebp)
      name[1] = '0' + i;
    11c2:	8d 46 30             	lea    0x30(%esi),%eax
    11c5:	88 45 d9             	mov    %al,-0x27(%ebp)
      unlink(name);
    11c8:	83 ec 0c             	sub    $0xc,%esp
    11cb:	8d 45 d8             	lea    -0x28(%ebp),%eax
    11ce:	50                   	push   %eax
    11cf:	e8 1f 26 00 00       	call   37f3 <unlink>
    for(pi = 0; pi < 4; pi++){
    11d4:	83 c3 01             	add    $0x1,%ebx
    11d7:	83 c4 10             	add    $0x10,%esp
    11da:	83 fb 03             	cmp    $0x3,%ebx
    11dd:	7e dd                	jle    11bc <createdelete+0x1aa>
  for(i = 0; i < N; i++){
    11df:	83 c6 01             	add    $0x1,%esi
    11e2:	83 fe 13             	cmp    $0x13,%esi
    11e5:	7f 07                	jg     11ee <createdelete+0x1dc>
    for(pi = 0; pi < 4; pi++){
    11e7:	bb 00 00 00 00       	mov    $0x0,%ebx
    11ec:	eb ec                	jmp    11da <createdelete+0x1c8>
    }
  }

  printf(1, "createdelete ok\n");
    11ee:	83 ec 08             	sub    $0x8,%esp
    11f1:	68 73 40 00 00       	push   $0x4073
    11f6:	6a 01                	push   $0x1
    11f8:	e8 fb 26 00 00       	call   38f8 <printf>
}
    11fd:	83 c4 10             	add    $0x10,%esp
    1200:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1203:	5b                   	pop    %ebx
    1204:	5e                   	pop    %esi
    1205:	5d                   	pop    %ebp
    1206:	c3                   	ret    

00001207 <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1207:	55                   	push   %ebp
    1208:	89 e5                	mov    %esp,%ebp
    120a:	56                   	push   %esi
    120b:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    120c:	83 ec 08             	sub    $0x8,%esp
    120f:	68 84 40 00 00       	push   $0x4084
    1214:	6a 01                	push   $0x1
    1216:	e8 dd 26 00 00       	call   38f8 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    121b:	83 c4 08             	add    $0x8,%esp
    121e:	68 02 02 00 00       	push   $0x202
    1223:	68 95 40 00 00       	push   $0x4095
    1228:	e8 b6 25 00 00       	call   37e3 <open>
  if(fd < 0){
    122d:	83 c4 10             	add    $0x10,%esp
    1230:	85 c0                	test   %eax,%eax
    1232:	0f 88 f0 00 00 00    	js     1328 <unlinkread+0x121>
    1238:	89 c3                	mov    %eax,%ebx
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    123a:	83 ec 04             	sub    $0x4,%esp
    123d:	6a 05                	push   $0x5
    123f:	68 ba 40 00 00       	push   $0x40ba
    1244:	50                   	push   %eax
    1245:	e8 79 25 00 00       	call   37c3 <write>
  close(fd);
    124a:	89 1c 24             	mov    %ebx,(%esp)
    124d:	e8 79 25 00 00       	call   37cb <close>

  fd = open("unlinkread", O_RDWR);
    1252:	83 c4 08             	add    $0x8,%esp
    1255:	6a 02                	push   $0x2
    1257:	68 95 40 00 00       	push   $0x4095
    125c:	e8 82 25 00 00       	call   37e3 <open>
    1261:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1263:	83 c4 10             	add    $0x10,%esp
    1266:	85 c0                	test   %eax,%eax
    1268:	0f 88 ce 00 00 00    	js     133c <unlinkread+0x135>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    126e:	83 ec 0c             	sub    $0xc,%esp
    1271:	68 95 40 00 00       	push   $0x4095
    1276:	e8 78 25 00 00       	call   37f3 <unlink>
    127b:	83 c4 10             	add    $0x10,%esp
    127e:	85 c0                	test   %eax,%eax
    1280:	0f 85 ca 00 00 00    	jne    1350 <unlinkread+0x149>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1286:	83 ec 08             	sub    $0x8,%esp
    1289:	68 02 02 00 00       	push   $0x202
    128e:	68 95 40 00 00       	push   $0x4095
    1293:	e8 4b 25 00 00       	call   37e3 <open>
    1298:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    129a:	83 c4 0c             	add    $0xc,%esp
    129d:	6a 03                	push   $0x3
    129f:	68 f2 40 00 00       	push   $0x40f2
    12a4:	50                   	push   %eax
    12a5:	e8 19 25 00 00       	call   37c3 <write>
  close(fd1);
    12aa:	89 34 24             	mov    %esi,(%esp)
    12ad:	e8 19 25 00 00       	call   37cb <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    12b2:	83 c4 0c             	add    $0xc,%esp
    12b5:	68 00 20 00 00       	push   $0x2000
    12ba:	68 20 84 00 00       	push   $0x8420
    12bf:	53                   	push   %ebx
    12c0:	e8 f6 24 00 00       	call   37bb <read>
    12c5:	83 c4 10             	add    $0x10,%esp
    12c8:	83 f8 05             	cmp    $0x5,%eax
    12cb:	0f 85 93 00 00 00    	jne    1364 <unlinkread+0x15d>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    12d1:	80 3d 20 84 00 00 68 	cmpb   $0x68,0x8420
    12d8:	0f 85 9a 00 00 00    	jne    1378 <unlinkread+0x171>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    12de:	83 ec 04             	sub    $0x4,%esp
    12e1:	6a 0a                	push   $0xa
    12e3:	68 20 84 00 00       	push   $0x8420
    12e8:	53                   	push   %ebx
    12e9:	e8 d5 24 00 00       	call   37c3 <write>
    12ee:	83 c4 10             	add    $0x10,%esp
    12f1:	83 f8 0a             	cmp    $0xa,%eax
    12f4:	0f 85 92 00 00 00    	jne    138c <unlinkread+0x185>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    12fa:	83 ec 0c             	sub    $0xc,%esp
    12fd:	53                   	push   %ebx
    12fe:	e8 c8 24 00 00       	call   37cb <close>
  unlink("unlinkread");
    1303:	c7 04 24 95 40 00 00 	movl   $0x4095,(%esp)
    130a:	e8 e4 24 00 00       	call   37f3 <unlink>
  printf(1, "unlinkread ok\n");
    130f:	83 c4 08             	add    $0x8,%esp
    1312:	68 3d 41 00 00       	push   $0x413d
    1317:	6a 01                	push   $0x1
    1319:	e8 da 25 00 00       	call   38f8 <printf>
}
    131e:	83 c4 10             	add    $0x10,%esp
    1321:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1324:	5b                   	pop    %ebx
    1325:	5e                   	pop    %esi
    1326:	5d                   	pop    %ebp
    1327:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1328:	83 ec 08             	sub    $0x8,%esp
    132b:	68 a0 40 00 00       	push   $0x40a0
    1330:	6a 01                	push   $0x1
    1332:	e8 c1 25 00 00       	call   38f8 <printf>
    exit();
    1337:	e8 67 24 00 00       	call   37a3 <exit>
    printf(1, "open unlinkread failed\n");
    133c:	83 ec 08             	sub    $0x8,%esp
    133f:	68 c0 40 00 00       	push   $0x40c0
    1344:	6a 01                	push   $0x1
    1346:	e8 ad 25 00 00       	call   38f8 <printf>
    exit();
    134b:	e8 53 24 00 00       	call   37a3 <exit>
    printf(1, "unlink unlinkread failed\n");
    1350:	83 ec 08             	sub    $0x8,%esp
    1353:	68 d8 40 00 00       	push   $0x40d8
    1358:	6a 01                	push   $0x1
    135a:	e8 99 25 00 00       	call   38f8 <printf>
    exit();
    135f:	e8 3f 24 00 00       	call   37a3 <exit>
    printf(1, "unlinkread read failed");
    1364:	83 ec 08             	sub    $0x8,%esp
    1367:	68 f6 40 00 00       	push   $0x40f6
    136c:	6a 01                	push   $0x1
    136e:	e8 85 25 00 00       	call   38f8 <printf>
    exit();
    1373:	e8 2b 24 00 00       	call   37a3 <exit>
    printf(1, "unlinkread wrong data\n");
    1378:	83 ec 08             	sub    $0x8,%esp
    137b:	68 0d 41 00 00       	push   $0x410d
    1380:	6a 01                	push   $0x1
    1382:	e8 71 25 00 00       	call   38f8 <printf>
    exit();
    1387:	e8 17 24 00 00       	call   37a3 <exit>
    printf(1, "unlinkread write failed\n");
    138c:	83 ec 08             	sub    $0x8,%esp
    138f:	68 24 41 00 00       	push   $0x4124
    1394:	6a 01                	push   $0x1
    1396:	e8 5d 25 00 00       	call   38f8 <printf>
    exit();
    139b:	e8 03 24 00 00       	call   37a3 <exit>

000013a0 <linktest>:

void
linktest(void)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	53                   	push   %ebx
    13a4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    13a7:	68 4c 41 00 00       	push   $0x414c
    13ac:	6a 01                	push   $0x1
    13ae:	e8 45 25 00 00       	call   38f8 <printf>

  unlink("lf1");
    13b3:	c7 04 24 56 41 00 00 	movl   $0x4156,(%esp)
    13ba:	e8 34 24 00 00       	call   37f3 <unlink>
  unlink("lf2");
    13bf:	c7 04 24 5a 41 00 00 	movl   $0x415a,(%esp)
    13c6:	e8 28 24 00 00       	call   37f3 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    13cb:	83 c4 08             	add    $0x8,%esp
    13ce:	68 02 02 00 00       	push   $0x202
    13d3:	68 56 41 00 00       	push   $0x4156
    13d8:	e8 06 24 00 00       	call   37e3 <open>
  if(fd < 0){
    13dd:	83 c4 10             	add    $0x10,%esp
    13e0:	85 c0                	test   %eax,%eax
    13e2:	0f 88 2a 01 00 00    	js     1512 <linktest+0x172>
    13e8:	89 c3                	mov    %eax,%ebx
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    13ea:	83 ec 04             	sub    $0x4,%esp
    13ed:	6a 05                	push   $0x5
    13ef:	68 ba 40 00 00       	push   $0x40ba
    13f4:	50                   	push   %eax
    13f5:	e8 c9 23 00 00       	call   37c3 <write>
    13fa:	83 c4 10             	add    $0x10,%esp
    13fd:	83 f8 05             	cmp    $0x5,%eax
    1400:	0f 85 20 01 00 00    	jne    1526 <linktest+0x186>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1406:	83 ec 0c             	sub    $0xc,%esp
    1409:	53                   	push   %ebx
    140a:	e8 bc 23 00 00       	call   37cb <close>

  if(link("lf1", "lf2") < 0){
    140f:	83 c4 08             	add    $0x8,%esp
    1412:	68 5a 41 00 00       	push   $0x415a
    1417:	68 56 41 00 00       	push   $0x4156
    141c:	e8 e2 23 00 00       	call   3803 <link>
    1421:	83 c4 10             	add    $0x10,%esp
    1424:	85 c0                	test   %eax,%eax
    1426:	0f 88 0e 01 00 00    	js     153a <linktest+0x19a>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    142c:	83 ec 0c             	sub    $0xc,%esp
    142f:	68 56 41 00 00       	push   $0x4156
    1434:	e8 ba 23 00 00       	call   37f3 <unlink>

  if(open("lf1", 0) >= 0){
    1439:	83 c4 08             	add    $0x8,%esp
    143c:	6a 00                	push   $0x0
    143e:	68 56 41 00 00       	push   $0x4156
    1443:	e8 9b 23 00 00       	call   37e3 <open>
    1448:	83 c4 10             	add    $0x10,%esp
    144b:	85 c0                	test   %eax,%eax
    144d:	0f 89 fb 00 00 00    	jns    154e <linktest+0x1ae>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1453:	83 ec 08             	sub    $0x8,%esp
    1456:	6a 00                	push   $0x0
    1458:	68 5a 41 00 00       	push   $0x415a
    145d:	e8 81 23 00 00       	call   37e3 <open>
    1462:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1464:	83 c4 10             	add    $0x10,%esp
    1467:	85 c0                	test   %eax,%eax
    1469:	0f 88 f3 00 00 00    	js     1562 <linktest+0x1c2>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    146f:	83 ec 04             	sub    $0x4,%esp
    1472:	68 00 20 00 00       	push   $0x2000
    1477:	68 20 84 00 00       	push   $0x8420
    147c:	50                   	push   %eax
    147d:	e8 39 23 00 00       	call   37bb <read>
    1482:	83 c4 10             	add    $0x10,%esp
    1485:	83 f8 05             	cmp    $0x5,%eax
    1488:	0f 85 e8 00 00 00    	jne    1576 <linktest+0x1d6>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    148e:	83 ec 0c             	sub    $0xc,%esp
    1491:	53                   	push   %ebx
    1492:	e8 34 23 00 00       	call   37cb <close>

  if(link("lf2", "lf2") >= 0){
    1497:	83 c4 08             	add    $0x8,%esp
    149a:	68 5a 41 00 00       	push   $0x415a
    149f:	68 5a 41 00 00       	push   $0x415a
    14a4:	e8 5a 23 00 00       	call   3803 <link>
    14a9:	83 c4 10             	add    $0x10,%esp
    14ac:	85 c0                	test   %eax,%eax
    14ae:	0f 89 d6 00 00 00    	jns    158a <linktest+0x1ea>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    14b4:	83 ec 0c             	sub    $0xc,%esp
    14b7:	68 5a 41 00 00       	push   $0x415a
    14bc:	e8 32 23 00 00       	call   37f3 <unlink>
  if(link("lf2", "lf1") >= 0){
    14c1:	83 c4 08             	add    $0x8,%esp
    14c4:	68 56 41 00 00       	push   $0x4156
    14c9:	68 5a 41 00 00       	push   $0x415a
    14ce:	e8 30 23 00 00       	call   3803 <link>
    14d3:	83 c4 10             	add    $0x10,%esp
    14d6:	85 c0                	test   %eax,%eax
    14d8:	0f 89 c0 00 00 00    	jns    159e <linktest+0x1fe>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    14de:	83 ec 08             	sub    $0x8,%esp
    14e1:	68 56 41 00 00       	push   $0x4156
    14e6:	68 1e 44 00 00       	push   $0x441e
    14eb:	e8 13 23 00 00       	call   3803 <link>
    14f0:	83 c4 10             	add    $0x10,%esp
    14f3:	85 c0                	test   %eax,%eax
    14f5:	0f 89 b7 00 00 00    	jns    15b2 <linktest+0x212>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    14fb:	83 ec 08             	sub    $0x8,%esp
    14fe:	68 f4 41 00 00       	push   $0x41f4
    1503:	6a 01                	push   $0x1
    1505:	e8 ee 23 00 00       	call   38f8 <printf>
}
    150a:	83 c4 10             	add    $0x10,%esp
    150d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1510:	c9                   	leave  
    1511:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1512:	83 ec 08             	sub    $0x8,%esp
    1515:	68 5e 41 00 00       	push   $0x415e
    151a:	6a 01                	push   $0x1
    151c:	e8 d7 23 00 00       	call   38f8 <printf>
    exit();
    1521:	e8 7d 22 00 00       	call   37a3 <exit>
    printf(1, "write lf1 failed\n");
    1526:	83 ec 08             	sub    $0x8,%esp
    1529:	68 71 41 00 00       	push   $0x4171
    152e:	6a 01                	push   $0x1
    1530:	e8 c3 23 00 00       	call   38f8 <printf>
    exit();
    1535:	e8 69 22 00 00       	call   37a3 <exit>
    printf(1, "link lf1 lf2 failed\n");
    153a:	83 ec 08             	sub    $0x8,%esp
    153d:	68 83 41 00 00       	push   $0x4183
    1542:	6a 01                	push   $0x1
    1544:	e8 af 23 00 00       	call   38f8 <printf>
    exit();
    1549:	e8 55 22 00 00       	call   37a3 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    154e:	83 ec 08             	sub    $0x8,%esp
    1551:	68 64 4d 00 00       	push   $0x4d64
    1556:	6a 01                	push   $0x1
    1558:	e8 9b 23 00 00       	call   38f8 <printf>
    exit();
    155d:	e8 41 22 00 00       	call   37a3 <exit>
    printf(1, "open lf2 failed\n");
    1562:	83 ec 08             	sub    $0x8,%esp
    1565:	68 98 41 00 00       	push   $0x4198
    156a:	6a 01                	push   $0x1
    156c:	e8 87 23 00 00       	call   38f8 <printf>
    exit();
    1571:	e8 2d 22 00 00       	call   37a3 <exit>
    printf(1, "read lf2 failed\n");
    1576:	83 ec 08             	sub    $0x8,%esp
    1579:	68 a9 41 00 00       	push   $0x41a9
    157e:	6a 01                	push   $0x1
    1580:	e8 73 23 00 00       	call   38f8 <printf>
    exit();
    1585:	e8 19 22 00 00       	call   37a3 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    158a:	83 ec 08             	sub    $0x8,%esp
    158d:	68 ba 41 00 00       	push   $0x41ba
    1592:	6a 01                	push   $0x1
    1594:	e8 5f 23 00 00       	call   38f8 <printf>
    exit();
    1599:	e8 05 22 00 00       	call   37a3 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    159e:	83 ec 08             	sub    $0x8,%esp
    15a1:	68 8c 4d 00 00       	push   $0x4d8c
    15a6:	6a 01                	push   $0x1
    15a8:	e8 4b 23 00 00       	call   38f8 <printf>
    exit();
    15ad:	e8 f1 21 00 00       	call   37a3 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    15b2:	83 ec 08             	sub    $0x8,%esp
    15b5:	68 d8 41 00 00       	push   $0x41d8
    15ba:	6a 01                	push   $0x1
    15bc:	e8 37 23 00 00       	call   38f8 <printf>
    exit();
    15c1:	e8 dd 21 00 00       	call   37a3 <exit>

000015c6 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    15c6:	55                   	push   %ebp
    15c7:	89 e5                	mov    %esp,%ebp
    15c9:	57                   	push   %edi
    15ca:	56                   	push   %esi
    15cb:	53                   	push   %ebx
    15cc:	83 ec 54             	sub    $0x54,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    15cf:	68 01 42 00 00       	push   $0x4201
    15d4:	6a 01                	push   $0x1
    15d6:	e8 1d 23 00 00       	call   38f8 <printf>
  file[0] = 'C';
    15db:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    15df:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    15e3:	83 c4 10             	add    $0x10,%esp
    15e6:	bb 00 00 00 00       	mov    $0x0,%ebx
    15eb:	eb 5e                	jmp    164b <concreate+0x85>
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    15ed:	85 f6                	test   %esi,%esi
    15ef:	75 22                	jne    1613 <concreate+0x4d>
    15f1:	ba 67 66 66 66       	mov    $0x66666667,%edx
    15f6:	89 d8                	mov    %ebx,%eax
    15f8:	f7 ea                	imul   %edx
    15fa:	d1 fa                	sar    %edx
    15fc:	89 d8                	mov    %ebx,%eax
    15fe:	c1 f8 1f             	sar    $0x1f,%eax
    1601:	29 c2                	sub    %eax,%edx
    1603:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1606:	89 da                	mov    %ebx,%edx
    1608:	29 c2                	sub    %eax,%edx
    160a:	83 fa 01             	cmp    $0x1,%edx
    160d:	0f 84 9b 00 00 00    	je     16ae <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1613:	83 ec 08             	sub    $0x8,%esp
    1616:	68 02 02 00 00       	push   $0x202
    161b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    161e:	50                   	push   %eax
    161f:	e8 bf 21 00 00       	call   37e3 <open>
      if(fd < 0){
    1624:	83 c4 10             	add    $0x10,%esp
    1627:	85 c0                	test   %eax,%eax
    1629:	0f 88 98 00 00 00    	js     16c7 <concreate+0x101>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    162f:	83 ec 0c             	sub    $0xc,%esp
    1632:	50                   	push   %eax
    1633:	e8 93 21 00 00       	call   37cb <close>
    1638:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    163b:	85 f6                	test   %esi,%esi
    163d:	0f 84 9c 00 00 00    	je     16df <concreate+0x119>
      exit();
    else
      wait();
    1643:	e8 63 21 00 00       	call   37ab <wait>
  for(i = 0; i < 40; i++){
    1648:	83 c3 01             	add    $0x1,%ebx
    164b:	83 fb 27             	cmp    $0x27,%ebx
    164e:	0f 8f 90 00 00 00    	jg     16e4 <concreate+0x11e>
    file[1] = '0' + i;
    1654:	8d 43 30             	lea    0x30(%ebx),%eax
    1657:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    165a:	83 ec 0c             	sub    $0xc,%esp
    165d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1660:	50                   	push   %eax
    1661:	e8 8d 21 00 00       	call   37f3 <unlink>
    pid = fork();
    1666:	e8 30 21 00 00       	call   379b <fork>
    166b:	89 c6                	mov    %eax,%esi
    if(pid && (i % 3) == 1){
    166d:	83 c4 10             	add    $0x10,%esp
    1670:	85 c0                	test   %eax,%eax
    1672:	0f 84 75 ff ff ff    	je     15ed <concreate+0x27>
    1678:	ba 56 55 55 55       	mov    $0x55555556,%edx
    167d:	89 d8                	mov    %ebx,%eax
    167f:	f7 ea                	imul   %edx
    1681:	89 d8                	mov    %ebx,%eax
    1683:	c1 f8 1f             	sar    $0x1f,%eax
    1686:	29 c2                	sub    %eax,%edx
    1688:	8d 04 52             	lea    (%edx,%edx,2),%eax
    168b:	89 da                	mov    %ebx,%edx
    168d:	29 c2                	sub    %eax,%edx
    168f:	83 fa 01             	cmp    $0x1,%edx
    1692:	0f 85 55 ff ff ff    	jne    15ed <concreate+0x27>
      link("C0", file);
    1698:	83 ec 08             	sub    $0x8,%esp
    169b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    169e:	50                   	push   %eax
    169f:	68 11 42 00 00       	push   $0x4211
    16a4:	e8 5a 21 00 00       	call   3803 <link>
    16a9:	83 c4 10             	add    $0x10,%esp
    16ac:	eb 8d                	jmp    163b <concreate+0x75>
      link("C0", file);
    16ae:	83 ec 08             	sub    $0x8,%esp
    16b1:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16b4:	50                   	push   %eax
    16b5:	68 11 42 00 00       	push   $0x4211
    16ba:	e8 44 21 00 00       	call   3803 <link>
    16bf:	83 c4 10             	add    $0x10,%esp
    16c2:	e9 74 ff ff ff       	jmp    163b <concreate+0x75>
        printf(1, "concreate create %s failed\n", file);
    16c7:	83 ec 04             	sub    $0x4,%esp
    16ca:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16cd:	50                   	push   %eax
    16ce:	68 14 42 00 00       	push   $0x4214
    16d3:	6a 01                	push   $0x1
    16d5:	e8 1e 22 00 00       	call   38f8 <printf>
        exit();
    16da:	e8 c4 20 00 00       	call   37a3 <exit>
      exit();
    16df:	e8 bf 20 00 00       	call   37a3 <exit>
  }

  memset(fa, 0, sizeof(fa));
    16e4:	83 ec 04             	sub    $0x4,%esp
    16e7:	6a 28                	push   $0x28
    16e9:	6a 00                	push   $0x0
    16eb:	8d 45 bd             	lea    -0x43(%ebp),%eax
    16ee:	50                   	push   %eax
    16ef:	e8 e9 1e 00 00       	call   35dd <memset>
  fd = open(".", 0);
    16f4:	83 c4 08             	add    $0x8,%esp
    16f7:	6a 00                	push   $0x0
    16f9:	68 1e 44 00 00       	push   $0x441e
    16fe:	e8 e0 20 00 00       	call   37e3 <open>
    1703:	89 c3                	mov    %eax,%ebx
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1705:	83 c4 10             	add    $0x10,%esp
  n = 0;
    1708:	be 00 00 00 00       	mov    $0x0,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    170d:	83 ec 04             	sub    $0x4,%esp
    1710:	6a 10                	push   $0x10
    1712:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1715:	50                   	push   %eax
    1716:	53                   	push   %ebx
    1717:	e8 9f 20 00 00       	call   37bb <read>
    171c:	83 c4 10             	add    $0x10,%esp
    171f:	85 c0                	test   %eax,%eax
    1721:	7e 60                	jle    1783 <concreate+0x1bd>
    if(de.inum == 0)
    1723:	66 83 7d ac 00       	cmpw   $0x0,-0x54(%ebp)
    1728:	74 e3                	je     170d <concreate+0x147>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    172a:	80 7d ae 43          	cmpb   $0x43,-0x52(%ebp)
    172e:	75 dd                	jne    170d <concreate+0x147>
    1730:	80 7d b0 00          	cmpb   $0x0,-0x50(%ebp)
    1734:	75 d7                	jne    170d <concreate+0x147>
      i = de.name[1] - '0';
    1736:	0f be 45 af          	movsbl -0x51(%ebp),%eax
    173a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    173d:	83 f8 27             	cmp    $0x27,%eax
    1740:	77 11                	ja     1753 <concreate+0x18d>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    1742:	80 7c 05 bd 00       	cmpb   $0x0,-0x43(%ebp,%eax,1)
    1747:	75 22                	jne    176b <concreate+0x1a5>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1749:	c6 44 05 bd 01       	movb   $0x1,-0x43(%ebp,%eax,1)
      n++;
    174e:	83 c6 01             	add    $0x1,%esi
    1751:	eb ba                	jmp    170d <concreate+0x147>
        printf(1, "concreate weird file %s\n", de.name);
    1753:	83 ec 04             	sub    $0x4,%esp
    1756:	8d 45 ae             	lea    -0x52(%ebp),%eax
    1759:	50                   	push   %eax
    175a:	68 30 42 00 00       	push   $0x4230
    175f:	6a 01                	push   $0x1
    1761:	e8 92 21 00 00       	call   38f8 <printf>
        exit();
    1766:	e8 38 20 00 00       	call   37a3 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    176b:	83 ec 04             	sub    $0x4,%esp
    176e:	8d 45 ae             	lea    -0x52(%ebp),%eax
    1771:	50                   	push   %eax
    1772:	68 49 42 00 00       	push   $0x4249
    1777:	6a 01                	push   $0x1
    1779:	e8 7a 21 00 00       	call   38f8 <printf>
        exit();
    177e:	e8 20 20 00 00       	call   37a3 <exit>
    }
  }
  close(fd);
    1783:	83 ec 0c             	sub    $0xc,%esp
    1786:	53                   	push   %ebx
    1787:	e8 3f 20 00 00       	call   37cb <close>

  if(n != 40){
    178c:	83 c4 10             	add    $0x10,%esp
    178f:	83 fe 28             	cmp    $0x28,%esi
    1792:	75 0a                	jne    179e <concreate+0x1d8>
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1794:	bb 00 00 00 00       	mov    $0x0,%ebx
    1799:	e9 86 00 00 00       	jmp    1824 <concreate+0x25e>
    printf(1, "concreate not enough files in directory listing\n");
    179e:	83 ec 08             	sub    $0x8,%esp
    17a1:	68 b0 4d 00 00       	push   $0x4db0
    17a6:	6a 01                	push   $0x1
    17a8:	e8 4b 21 00 00       	call   38f8 <printf>
    exit();
    17ad:	e8 f1 1f 00 00       	call   37a3 <exit>
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    17b2:	83 ec 08             	sub    $0x8,%esp
    17b5:	68 e9 4a 00 00       	push   $0x4ae9
    17ba:	6a 01                	push   $0x1
    17bc:	e8 37 21 00 00       	call   38f8 <printf>
      exit();
    17c1:	e8 dd 1f 00 00       	call   37a3 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
      close(open(file, 0));
    17c6:	83 ec 08             	sub    $0x8,%esp
    17c9:	6a 00                	push   $0x0
    17cb:	8d 7d e5             	lea    -0x1b(%ebp),%edi
    17ce:	57                   	push   %edi
    17cf:	e8 0f 20 00 00       	call   37e3 <open>
    17d4:	89 04 24             	mov    %eax,(%esp)
    17d7:	e8 ef 1f 00 00       	call   37cb <close>
      close(open(file, 0));
    17dc:	83 c4 08             	add    $0x8,%esp
    17df:	6a 00                	push   $0x0
    17e1:	57                   	push   %edi
    17e2:	e8 fc 1f 00 00       	call   37e3 <open>
    17e7:	89 04 24             	mov    %eax,(%esp)
    17ea:	e8 dc 1f 00 00       	call   37cb <close>
      close(open(file, 0));
    17ef:	83 c4 08             	add    $0x8,%esp
    17f2:	6a 00                	push   $0x0
    17f4:	57                   	push   %edi
    17f5:	e8 e9 1f 00 00       	call   37e3 <open>
    17fa:	89 04 24             	mov    %eax,(%esp)
    17fd:	e8 c9 1f 00 00       	call   37cb <close>
      close(open(file, 0));
    1802:	83 c4 08             	add    $0x8,%esp
    1805:	6a 00                	push   $0x0
    1807:	57                   	push   %edi
    1808:	e8 d6 1f 00 00       	call   37e3 <open>
    180d:	89 04 24             	mov    %eax,(%esp)
    1810:	e8 b6 1f 00 00       	call   37cb <close>
    1815:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    1818:	85 f6                	test   %esi,%esi
    181a:	74 79                	je     1895 <concreate+0x2cf>
      exit();
    else
      wait();
    181c:	e8 8a 1f 00 00       	call   37ab <wait>
  for(i = 0; i < 40; i++){
    1821:	83 c3 01             	add    $0x1,%ebx
    1824:	83 fb 27             	cmp    $0x27,%ebx
    1827:	7f 71                	jg     189a <concreate+0x2d4>
    file[1] = '0' + i;
    1829:	8d 43 30             	lea    0x30(%ebx),%eax
    182c:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    182f:	e8 67 1f 00 00       	call   379b <fork>
    1834:	89 c6                	mov    %eax,%esi
    if(pid < 0){
    1836:	85 c0                	test   %eax,%eax
    1838:	0f 88 74 ff ff ff    	js     17b2 <concreate+0x1ec>
    if(((i % 3) == 0 && pid == 0) ||
    183e:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1843:	89 d8                	mov    %ebx,%eax
    1845:	f7 ea                	imul   %edx
    1847:	89 d8                	mov    %ebx,%eax
    1849:	c1 f8 1f             	sar    $0x1f,%eax
    184c:	29 c2                	sub    %eax,%edx
    184e:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1851:	89 da                	mov    %ebx,%edx
    1853:	29 c2                	sub    %eax,%edx
    1855:	89 d0                	mov    %edx,%eax
    1857:	09 f0                	or     %esi,%eax
    1859:	0f 84 67 ff ff ff    	je     17c6 <concreate+0x200>
    185f:	83 fa 01             	cmp    $0x1,%edx
    1862:	75 08                	jne    186c <concreate+0x2a6>
       ((i % 3) == 1 && pid != 0)){
    1864:	85 f6                	test   %esi,%esi
    1866:	0f 85 5a ff ff ff    	jne    17c6 <concreate+0x200>
      unlink(file);
    186c:	83 ec 0c             	sub    $0xc,%esp
    186f:	8d 7d e5             	lea    -0x1b(%ebp),%edi
    1872:	57                   	push   %edi
    1873:	e8 7b 1f 00 00       	call   37f3 <unlink>
      unlink(file);
    1878:	89 3c 24             	mov    %edi,(%esp)
    187b:	e8 73 1f 00 00       	call   37f3 <unlink>
      unlink(file);
    1880:	89 3c 24             	mov    %edi,(%esp)
    1883:	e8 6b 1f 00 00       	call   37f3 <unlink>
      unlink(file);
    1888:	89 3c 24             	mov    %edi,(%esp)
    188b:	e8 63 1f 00 00       	call   37f3 <unlink>
    1890:	83 c4 10             	add    $0x10,%esp
    1893:	eb 83                	jmp    1818 <concreate+0x252>
      exit();
    1895:	e8 09 1f 00 00       	call   37a3 <exit>
  }

  printf(1, "concreate ok\n");
    189a:	83 ec 08             	sub    $0x8,%esp
    189d:	68 66 42 00 00       	push   $0x4266
    18a2:	6a 01                	push   $0x1
    18a4:	e8 4f 20 00 00       	call   38f8 <printf>
}
    18a9:	83 c4 10             	add    $0x10,%esp
    18ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18af:	5b                   	pop    %ebx
    18b0:	5e                   	pop    %esi
    18b1:	5f                   	pop    %edi
    18b2:	5d                   	pop    %ebp
    18b3:	c3                   	ret    

000018b4 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    18b4:	55                   	push   %ebp
    18b5:	89 e5                	mov    %esp,%ebp
    18b7:	57                   	push   %edi
    18b8:	56                   	push   %esi
    18b9:	53                   	push   %ebx
    18ba:	83 ec 14             	sub    $0x14,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    18bd:	68 74 42 00 00       	push   $0x4274
    18c2:	6a 01                	push   $0x1
    18c4:	e8 2f 20 00 00       	call   38f8 <printf>

  unlink("x");
    18c9:	c7 04 24 01 45 00 00 	movl   $0x4501,(%esp)
    18d0:	e8 1e 1f 00 00       	call   37f3 <unlink>
  pid = fork();
    18d5:	e8 c1 1e 00 00       	call   379b <fork>
  if(pid < 0){
    18da:	83 c4 10             	add    $0x10,%esp
    18dd:	85 c0                	test   %eax,%eax
    18df:	78 10                	js     18f1 <linkunlink+0x3d>
    18e1:	89 c7                	mov    %eax,%edi
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    18e3:	74 20                	je     1905 <linkunlink+0x51>
    18e5:	bb 01 00 00 00       	mov    $0x1,%ebx
    18ea:	be 00 00 00 00       	mov    $0x0,%esi
    18ef:	eb 3b                	jmp    192c <linkunlink+0x78>
    printf(1, "fork failed\n");
    18f1:	83 ec 08             	sub    $0x8,%esp
    18f4:	68 e9 4a 00 00       	push   $0x4ae9
    18f9:	6a 01                	push   $0x1
    18fb:	e8 f8 1f 00 00       	call   38f8 <printf>
    exit();
    1900:	e8 9e 1e 00 00       	call   37a3 <exit>
  unsigned int x = (pid ? 1 : 97);
    1905:	bb 61 00 00 00       	mov    $0x61,%ebx
    190a:	eb de                	jmp    18ea <linkunlink+0x36>
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    190c:	83 ec 08             	sub    $0x8,%esp
    190f:	68 02 02 00 00       	push   $0x202
    1914:	68 01 45 00 00       	push   $0x4501
    1919:	e8 c5 1e 00 00       	call   37e3 <open>
    191e:	89 04 24             	mov    %eax,(%esp)
    1921:	e8 a5 1e 00 00       	call   37cb <close>
    1926:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1929:	83 c6 01             	add    $0x1,%esi
    192c:	83 fe 63             	cmp    $0x63,%esi
    192f:	7f 52                	jg     1983 <linkunlink+0xcf>
    x = x * 1103515245 + 12345;
    1931:	69 db 6d 4e c6 41    	imul   $0x41c64e6d,%ebx,%ebx
    1937:	81 c3 39 30 00 00    	add    $0x3039,%ebx
    if((x % 3) == 0){
    193d:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1942:	89 d8                	mov    %ebx,%eax
    1944:	f7 e2                	mul    %edx
    1946:	89 d0                	mov    %edx,%eax
    1948:	d1 e8                	shr    %eax
    194a:	83 e2 fe             	and    $0xfffffffe,%edx
    194d:	01 c2                	add    %eax,%edx
    194f:	89 d8                	mov    %ebx,%eax
    1951:	29 d0                	sub    %edx,%eax
    1953:	74 b7                	je     190c <linkunlink+0x58>
    } else if((x % 3) == 1){
    1955:	83 f8 01             	cmp    $0x1,%eax
    1958:	74 12                	je     196c <linkunlink+0xb8>
      link("cat", "x");
    } else {
      unlink("x");
    195a:	83 ec 0c             	sub    $0xc,%esp
    195d:	68 01 45 00 00       	push   $0x4501
    1962:	e8 8c 1e 00 00       	call   37f3 <unlink>
    1967:	83 c4 10             	add    $0x10,%esp
    196a:	eb bd                	jmp    1929 <linkunlink+0x75>
      link("cat", "x");
    196c:	83 ec 08             	sub    $0x8,%esp
    196f:	68 01 45 00 00       	push   $0x4501
    1974:	68 85 42 00 00       	push   $0x4285
    1979:	e8 85 1e 00 00       	call   3803 <link>
    197e:	83 c4 10             	add    $0x10,%esp
    1981:	eb a6                	jmp    1929 <linkunlink+0x75>
    }
  }

  if(pid)
    1983:	85 ff                	test   %edi,%edi
    1985:	74 1c                	je     19a3 <linkunlink+0xef>
    wait();
    1987:	e8 1f 1e 00 00       	call   37ab <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    198c:	83 ec 08             	sub    $0x8,%esp
    198f:	68 89 42 00 00       	push   $0x4289
    1994:	6a 01                	push   $0x1
    1996:	e8 5d 1f 00 00       	call   38f8 <printf>
}
    199b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    199e:	5b                   	pop    %ebx
    199f:	5e                   	pop    %esi
    19a0:	5f                   	pop    %edi
    19a1:	5d                   	pop    %ebp
    19a2:	c3                   	ret    
    exit();
    19a3:	e8 fb 1d 00 00       	call   37a3 <exit>

000019a8 <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    19a8:	55                   	push   %ebp
    19a9:	89 e5                	mov    %esp,%ebp
    19ab:	53                   	push   %ebx
    19ac:	83 ec 1c             	sub    $0x1c,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    19af:	68 98 42 00 00       	push   $0x4298
    19b4:	6a 01                	push   $0x1
    19b6:	e8 3d 1f 00 00       	call   38f8 <printf>
  unlink("bd");
    19bb:	c7 04 24 a5 42 00 00 	movl   $0x42a5,(%esp)
    19c2:	e8 2c 1e 00 00       	call   37f3 <unlink>

  fd = open("bd", O_CREATE);
    19c7:	83 c4 08             	add    $0x8,%esp
    19ca:	68 00 02 00 00       	push   $0x200
    19cf:	68 a5 42 00 00       	push   $0x42a5
    19d4:	e8 0a 1e 00 00       	call   37e3 <open>
  if(fd < 0){
    19d9:	83 c4 10             	add    $0x10,%esp
    19dc:	85 c0                	test   %eax,%eax
    19de:	78 65                	js     1a45 <bigdir+0x9d>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    19e0:	83 ec 0c             	sub    $0xc,%esp
    19e3:	50                   	push   %eax
    19e4:	e8 e2 1d 00 00       	call   37cb <close>

  for(i = 0; i < 500; i++){
    19e9:	83 c4 10             	add    $0x10,%esp
    19ec:	bb 00 00 00 00       	mov    $0x0,%ebx
    19f1:	81 fb f3 01 00 00    	cmp    $0x1f3,%ebx
    19f7:	7f 74                	jg     1a6d <bigdir+0xc5>
    name[0] = 'x';
    19f9:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    19fd:	8d 43 3f             	lea    0x3f(%ebx),%eax
    1a00:	85 db                	test   %ebx,%ebx
    1a02:	0f 49 c3             	cmovns %ebx,%eax
    1a05:	c1 f8 06             	sar    $0x6,%eax
    1a08:	83 c0 30             	add    $0x30,%eax
    1a0b:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1a0e:	89 da                	mov    %ebx,%edx
    1a10:	c1 fa 1f             	sar    $0x1f,%edx
    1a13:	c1 ea 1a             	shr    $0x1a,%edx
    1a16:	8d 04 13             	lea    (%ebx,%edx,1),%eax
    1a19:	83 e0 3f             	and    $0x3f,%eax
    1a1c:	29 d0                	sub    %edx,%eax
    1a1e:	83 c0 30             	add    $0x30,%eax
    1a21:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1a24:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(link("bd", name) != 0){
    1a28:	83 ec 08             	sub    $0x8,%esp
    1a2b:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1a2e:	50                   	push   %eax
    1a2f:	68 a5 42 00 00       	push   $0x42a5
    1a34:	e8 ca 1d 00 00       	call   3803 <link>
    1a39:	83 c4 10             	add    $0x10,%esp
    1a3c:	85 c0                	test   %eax,%eax
    1a3e:	75 19                	jne    1a59 <bigdir+0xb1>
  for(i = 0; i < 500; i++){
    1a40:	83 c3 01             	add    $0x1,%ebx
    1a43:	eb ac                	jmp    19f1 <bigdir+0x49>
    printf(1, "bigdir create failed\n");
    1a45:	83 ec 08             	sub    $0x8,%esp
    1a48:	68 a8 42 00 00       	push   $0x42a8
    1a4d:	6a 01                	push   $0x1
    1a4f:	e8 a4 1e 00 00       	call   38f8 <printf>
    exit();
    1a54:	e8 4a 1d 00 00       	call   37a3 <exit>
      printf(1, "bigdir link failed\n");
    1a59:	83 ec 08             	sub    $0x8,%esp
    1a5c:	68 be 42 00 00       	push   $0x42be
    1a61:	6a 01                	push   $0x1
    1a63:	e8 90 1e 00 00       	call   38f8 <printf>
      exit();
    1a68:	e8 36 1d 00 00       	call   37a3 <exit>
    }
  }

  unlink("bd");
    1a6d:	83 ec 0c             	sub    $0xc,%esp
    1a70:	68 a5 42 00 00       	push   $0x42a5
    1a75:	e8 79 1d 00 00       	call   37f3 <unlink>
  for(i = 0; i < 500; i++){
    1a7a:	83 c4 10             	add    $0x10,%esp
    1a7d:	bb 00 00 00 00       	mov    $0x0,%ebx
    1a82:	eb 03                	jmp    1a87 <bigdir+0xdf>
    1a84:	83 c3 01             	add    $0x1,%ebx
    1a87:	81 fb f3 01 00 00    	cmp    $0x1f3,%ebx
    1a8d:	7f 56                	jg     1ae5 <bigdir+0x13d>
    name[0] = 'x';
    1a8f:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1a93:	8d 43 3f             	lea    0x3f(%ebx),%eax
    1a96:	85 db                	test   %ebx,%ebx
    1a98:	0f 49 c3             	cmovns %ebx,%eax
    1a9b:	c1 f8 06             	sar    $0x6,%eax
    1a9e:	83 c0 30             	add    $0x30,%eax
    1aa1:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1aa4:	89 da                	mov    %ebx,%edx
    1aa6:	c1 fa 1f             	sar    $0x1f,%edx
    1aa9:	c1 ea 1a             	shr    $0x1a,%edx
    1aac:	8d 04 13             	lea    (%ebx,%edx,1),%eax
    1aaf:	83 e0 3f             	and    $0x3f,%eax
    1ab2:	29 d0                	sub    %edx,%eax
    1ab4:	83 c0 30             	add    $0x30,%eax
    1ab7:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1aba:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(unlink(name) != 0){
    1abe:	83 ec 0c             	sub    $0xc,%esp
    1ac1:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1ac4:	50                   	push   %eax
    1ac5:	e8 29 1d 00 00       	call   37f3 <unlink>
    1aca:	83 c4 10             	add    $0x10,%esp
    1acd:	85 c0                	test   %eax,%eax
    1acf:	74 b3                	je     1a84 <bigdir+0xdc>
      printf(1, "bigdir unlink failed");
    1ad1:	83 ec 08             	sub    $0x8,%esp
    1ad4:	68 d2 42 00 00       	push   $0x42d2
    1ad9:	6a 01                	push   $0x1
    1adb:	e8 18 1e 00 00       	call   38f8 <printf>
      exit();
    1ae0:	e8 be 1c 00 00       	call   37a3 <exit>
    }
  }

  printf(1, "bigdir ok\n");
    1ae5:	83 ec 08             	sub    $0x8,%esp
    1ae8:	68 e7 42 00 00       	push   $0x42e7
    1aed:	6a 01                	push   $0x1
    1aef:	e8 04 1e 00 00       	call   38f8 <printf>
}
    1af4:	83 c4 10             	add    $0x10,%esp
    1af7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1afa:	c9                   	leave  
    1afb:	c3                   	ret    

00001afc <subdir>:

void
subdir(void)
{
    1afc:	55                   	push   %ebp
    1afd:	89 e5                	mov    %esp,%ebp
    1aff:	53                   	push   %ebx
    1b00:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1b03:	68 f2 42 00 00       	push   $0x42f2
    1b08:	6a 01                	push   $0x1
    1b0a:	e8 e9 1d 00 00       	call   38f8 <printf>

  unlink("ff");
    1b0f:	c7 04 24 7b 43 00 00 	movl   $0x437b,(%esp)
    1b16:	e8 d8 1c 00 00       	call   37f3 <unlink>
  if(mkdir("dd") != 0){
    1b1b:	c7 04 24 18 44 00 00 	movl   $0x4418,(%esp)
    1b22:	e8 e4 1c 00 00       	call   380b <mkdir>
    1b27:	83 c4 10             	add    $0x10,%esp
    1b2a:	85 c0                	test   %eax,%eax
    1b2c:	0f 85 14 04 00 00    	jne    1f46 <subdir+0x44a>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1b32:	83 ec 08             	sub    $0x8,%esp
    1b35:	68 02 02 00 00       	push   $0x202
    1b3a:	68 51 43 00 00       	push   $0x4351
    1b3f:	e8 9f 1c 00 00       	call   37e3 <open>
    1b44:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1b46:	83 c4 10             	add    $0x10,%esp
    1b49:	85 c0                	test   %eax,%eax
    1b4b:	0f 88 09 04 00 00    	js     1f5a <subdir+0x45e>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1b51:	83 ec 04             	sub    $0x4,%esp
    1b54:	6a 02                	push   $0x2
    1b56:	68 7b 43 00 00       	push   $0x437b
    1b5b:	50                   	push   %eax
    1b5c:	e8 62 1c 00 00       	call   37c3 <write>
  close(fd);
    1b61:	89 1c 24             	mov    %ebx,(%esp)
    1b64:	e8 62 1c 00 00       	call   37cb <close>

  if(unlink("dd") >= 0){
    1b69:	c7 04 24 18 44 00 00 	movl   $0x4418,(%esp)
    1b70:	e8 7e 1c 00 00       	call   37f3 <unlink>
    1b75:	83 c4 10             	add    $0x10,%esp
    1b78:	85 c0                	test   %eax,%eax
    1b7a:	0f 89 ee 03 00 00    	jns    1f6e <subdir+0x472>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1b80:	83 ec 0c             	sub    $0xc,%esp
    1b83:	68 2c 43 00 00       	push   $0x432c
    1b88:	e8 7e 1c 00 00       	call   380b <mkdir>
    1b8d:	83 c4 10             	add    $0x10,%esp
    1b90:	85 c0                	test   %eax,%eax
    1b92:	0f 85 ea 03 00 00    	jne    1f82 <subdir+0x486>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1b98:	83 ec 08             	sub    $0x8,%esp
    1b9b:	68 02 02 00 00       	push   $0x202
    1ba0:	68 4e 43 00 00       	push   $0x434e
    1ba5:	e8 39 1c 00 00       	call   37e3 <open>
    1baa:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1bac:	83 c4 10             	add    $0x10,%esp
    1baf:	85 c0                	test   %eax,%eax
    1bb1:	0f 88 df 03 00 00    	js     1f96 <subdir+0x49a>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1bb7:	83 ec 04             	sub    $0x4,%esp
    1bba:	6a 02                	push   $0x2
    1bbc:	68 6f 43 00 00       	push   $0x436f
    1bc1:	50                   	push   %eax
    1bc2:	e8 fc 1b 00 00       	call   37c3 <write>
  close(fd);
    1bc7:	89 1c 24             	mov    %ebx,(%esp)
    1bca:	e8 fc 1b 00 00       	call   37cb <close>

  fd = open("dd/dd/../ff", 0);
    1bcf:	83 c4 08             	add    $0x8,%esp
    1bd2:	6a 00                	push   $0x0
    1bd4:	68 72 43 00 00       	push   $0x4372
    1bd9:	e8 05 1c 00 00       	call   37e3 <open>
    1bde:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1be0:	83 c4 10             	add    $0x10,%esp
    1be3:	85 c0                	test   %eax,%eax
    1be5:	0f 88 bf 03 00 00    	js     1faa <subdir+0x4ae>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1beb:	83 ec 04             	sub    $0x4,%esp
    1bee:	68 00 20 00 00       	push   $0x2000
    1bf3:	68 20 84 00 00       	push   $0x8420
    1bf8:	50                   	push   %eax
    1bf9:	e8 bd 1b 00 00       	call   37bb <read>
  if(cc != 2 || buf[0] != 'f'){
    1bfe:	83 c4 10             	add    $0x10,%esp
    1c01:	83 f8 02             	cmp    $0x2,%eax
    1c04:	0f 85 b4 03 00 00    	jne    1fbe <subdir+0x4c2>
    1c0a:	80 3d 20 84 00 00 66 	cmpb   $0x66,0x8420
    1c11:	0f 85 a7 03 00 00    	jne    1fbe <subdir+0x4c2>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1c17:	83 ec 0c             	sub    $0xc,%esp
    1c1a:	53                   	push   %ebx
    1c1b:	e8 ab 1b 00 00       	call   37cb <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1c20:	83 c4 08             	add    $0x8,%esp
    1c23:	68 b2 43 00 00       	push   $0x43b2
    1c28:	68 4e 43 00 00       	push   $0x434e
    1c2d:	e8 d1 1b 00 00       	call   3803 <link>
    1c32:	83 c4 10             	add    $0x10,%esp
    1c35:	85 c0                	test   %eax,%eax
    1c37:	0f 85 95 03 00 00    	jne    1fd2 <subdir+0x4d6>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1c3d:	83 ec 0c             	sub    $0xc,%esp
    1c40:	68 4e 43 00 00       	push   $0x434e
    1c45:	e8 a9 1b 00 00       	call   37f3 <unlink>
    1c4a:	83 c4 10             	add    $0x10,%esp
    1c4d:	85 c0                	test   %eax,%eax
    1c4f:	0f 85 91 03 00 00    	jne    1fe6 <subdir+0x4ea>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1c55:	83 ec 08             	sub    $0x8,%esp
    1c58:	6a 00                	push   $0x0
    1c5a:	68 4e 43 00 00       	push   $0x434e
    1c5f:	e8 7f 1b 00 00       	call   37e3 <open>
    1c64:	83 c4 10             	add    $0x10,%esp
    1c67:	85 c0                	test   %eax,%eax
    1c69:	0f 89 8b 03 00 00    	jns    1ffa <subdir+0x4fe>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1c6f:	83 ec 0c             	sub    $0xc,%esp
    1c72:	68 18 44 00 00       	push   $0x4418
    1c77:	e8 97 1b 00 00       	call   3813 <chdir>
    1c7c:	83 c4 10             	add    $0x10,%esp
    1c7f:	85 c0                	test   %eax,%eax
    1c81:	0f 85 87 03 00 00    	jne    200e <subdir+0x512>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1c87:	83 ec 0c             	sub    $0xc,%esp
    1c8a:	68 e6 43 00 00       	push   $0x43e6
    1c8f:	e8 7f 1b 00 00       	call   3813 <chdir>
    1c94:	83 c4 10             	add    $0x10,%esp
    1c97:	85 c0                	test   %eax,%eax
    1c99:	0f 85 83 03 00 00    	jne    2022 <subdir+0x526>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1c9f:	83 ec 0c             	sub    $0xc,%esp
    1ca2:	68 0c 44 00 00       	push   $0x440c
    1ca7:	e8 67 1b 00 00       	call   3813 <chdir>
    1cac:	83 c4 10             	add    $0x10,%esp
    1caf:	85 c0                	test   %eax,%eax
    1cb1:	0f 85 7f 03 00 00    	jne    2036 <subdir+0x53a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1cb7:	83 ec 0c             	sub    $0xc,%esp
    1cba:	68 1b 44 00 00       	push   $0x441b
    1cbf:	e8 4f 1b 00 00       	call   3813 <chdir>
    1cc4:	83 c4 10             	add    $0x10,%esp
    1cc7:	85 c0                	test   %eax,%eax
    1cc9:	0f 85 7b 03 00 00    	jne    204a <subdir+0x54e>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ccf:	83 ec 08             	sub    $0x8,%esp
    1cd2:	6a 00                	push   $0x0
    1cd4:	68 b2 43 00 00       	push   $0x43b2
    1cd9:	e8 05 1b 00 00       	call   37e3 <open>
    1cde:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ce0:	83 c4 10             	add    $0x10,%esp
    1ce3:	85 c0                	test   %eax,%eax
    1ce5:	0f 88 73 03 00 00    	js     205e <subdir+0x562>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1ceb:	83 ec 04             	sub    $0x4,%esp
    1cee:	68 00 20 00 00       	push   $0x2000
    1cf3:	68 20 84 00 00       	push   $0x8420
    1cf8:	50                   	push   %eax
    1cf9:	e8 bd 1a 00 00       	call   37bb <read>
    1cfe:	83 c4 10             	add    $0x10,%esp
    1d01:	83 f8 02             	cmp    $0x2,%eax
    1d04:	0f 85 68 03 00 00    	jne    2072 <subdir+0x576>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1d0a:	83 ec 0c             	sub    $0xc,%esp
    1d0d:	53                   	push   %ebx
    1d0e:	e8 b8 1a 00 00       	call   37cb <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1d13:	83 c4 08             	add    $0x8,%esp
    1d16:	6a 00                	push   $0x0
    1d18:	68 4e 43 00 00       	push   $0x434e
    1d1d:	e8 c1 1a 00 00       	call   37e3 <open>
    1d22:	83 c4 10             	add    $0x10,%esp
    1d25:	85 c0                	test   %eax,%eax
    1d27:	0f 89 59 03 00 00    	jns    2086 <subdir+0x58a>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1d2d:	83 ec 08             	sub    $0x8,%esp
    1d30:	68 02 02 00 00       	push   $0x202
    1d35:	68 66 44 00 00       	push   $0x4466
    1d3a:	e8 a4 1a 00 00       	call   37e3 <open>
    1d3f:	83 c4 10             	add    $0x10,%esp
    1d42:	85 c0                	test   %eax,%eax
    1d44:	0f 89 50 03 00 00    	jns    209a <subdir+0x59e>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1d4a:	83 ec 08             	sub    $0x8,%esp
    1d4d:	68 02 02 00 00       	push   $0x202
    1d52:	68 8b 44 00 00       	push   $0x448b
    1d57:	e8 87 1a 00 00       	call   37e3 <open>
    1d5c:	83 c4 10             	add    $0x10,%esp
    1d5f:	85 c0                	test   %eax,%eax
    1d61:	0f 89 47 03 00 00    	jns    20ae <subdir+0x5b2>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1d67:	83 ec 08             	sub    $0x8,%esp
    1d6a:	68 00 02 00 00       	push   $0x200
    1d6f:	68 18 44 00 00       	push   $0x4418
    1d74:	e8 6a 1a 00 00       	call   37e3 <open>
    1d79:	83 c4 10             	add    $0x10,%esp
    1d7c:	85 c0                	test   %eax,%eax
    1d7e:	0f 89 3e 03 00 00    	jns    20c2 <subdir+0x5c6>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1d84:	83 ec 08             	sub    $0x8,%esp
    1d87:	6a 02                	push   $0x2
    1d89:	68 18 44 00 00       	push   $0x4418
    1d8e:	e8 50 1a 00 00       	call   37e3 <open>
    1d93:	83 c4 10             	add    $0x10,%esp
    1d96:	85 c0                	test   %eax,%eax
    1d98:	0f 89 38 03 00 00    	jns    20d6 <subdir+0x5da>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1d9e:	83 ec 08             	sub    $0x8,%esp
    1da1:	6a 01                	push   $0x1
    1da3:	68 18 44 00 00       	push   $0x4418
    1da8:	e8 36 1a 00 00       	call   37e3 <open>
    1dad:	83 c4 10             	add    $0x10,%esp
    1db0:	85 c0                	test   %eax,%eax
    1db2:	0f 89 32 03 00 00    	jns    20ea <subdir+0x5ee>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1db8:	83 ec 08             	sub    $0x8,%esp
    1dbb:	68 fa 44 00 00       	push   $0x44fa
    1dc0:	68 66 44 00 00       	push   $0x4466
    1dc5:	e8 39 1a 00 00       	call   3803 <link>
    1dca:	83 c4 10             	add    $0x10,%esp
    1dcd:	85 c0                	test   %eax,%eax
    1dcf:	0f 84 29 03 00 00    	je     20fe <subdir+0x602>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1dd5:	83 ec 08             	sub    $0x8,%esp
    1dd8:	68 fa 44 00 00       	push   $0x44fa
    1ddd:	68 8b 44 00 00       	push   $0x448b
    1de2:	e8 1c 1a 00 00       	call   3803 <link>
    1de7:	83 c4 10             	add    $0x10,%esp
    1dea:	85 c0                	test   %eax,%eax
    1dec:	0f 84 20 03 00 00    	je     2112 <subdir+0x616>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1df2:	83 ec 08             	sub    $0x8,%esp
    1df5:	68 b2 43 00 00       	push   $0x43b2
    1dfa:	68 51 43 00 00       	push   $0x4351
    1dff:	e8 ff 19 00 00       	call   3803 <link>
    1e04:	83 c4 10             	add    $0x10,%esp
    1e07:	85 c0                	test   %eax,%eax
    1e09:	0f 84 17 03 00 00    	je     2126 <subdir+0x62a>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    1e0f:	83 ec 0c             	sub    $0xc,%esp
    1e12:	68 66 44 00 00       	push   $0x4466
    1e17:	e8 ef 19 00 00       	call   380b <mkdir>
    1e1c:	83 c4 10             	add    $0x10,%esp
    1e1f:	85 c0                	test   %eax,%eax
    1e21:	0f 84 13 03 00 00    	je     213a <subdir+0x63e>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    1e27:	83 ec 0c             	sub    $0xc,%esp
    1e2a:	68 8b 44 00 00       	push   $0x448b
    1e2f:	e8 d7 19 00 00       	call   380b <mkdir>
    1e34:	83 c4 10             	add    $0x10,%esp
    1e37:	85 c0                	test   %eax,%eax
    1e39:	0f 84 0f 03 00 00    	je     214e <subdir+0x652>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    1e3f:	83 ec 0c             	sub    $0xc,%esp
    1e42:	68 b2 43 00 00       	push   $0x43b2
    1e47:	e8 bf 19 00 00       	call   380b <mkdir>
    1e4c:	83 c4 10             	add    $0x10,%esp
    1e4f:	85 c0                	test   %eax,%eax
    1e51:	0f 84 0b 03 00 00    	je     2162 <subdir+0x666>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    1e57:	83 ec 0c             	sub    $0xc,%esp
    1e5a:	68 8b 44 00 00       	push   $0x448b
    1e5f:	e8 8f 19 00 00       	call   37f3 <unlink>
    1e64:	83 c4 10             	add    $0x10,%esp
    1e67:	85 c0                	test   %eax,%eax
    1e69:	0f 84 07 03 00 00    	je     2176 <subdir+0x67a>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    1e6f:	83 ec 0c             	sub    $0xc,%esp
    1e72:	68 66 44 00 00       	push   $0x4466
    1e77:	e8 77 19 00 00       	call   37f3 <unlink>
    1e7c:	83 c4 10             	add    $0x10,%esp
    1e7f:	85 c0                	test   %eax,%eax
    1e81:	0f 84 03 03 00 00    	je     218a <subdir+0x68e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    1e87:	83 ec 0c             	sub    $0xc,%esp
    1e8a:	68 51 43 00 00       	push   $0x4351
    1e8f:	e8 7f 19 00 00       	call   3813 <chdir>
    1e94:	83 c4 10             	add    $0x10,%esp
    1e97:	85 c0                	test   %eax,%eax
    1e99:	0f 84 ff 02 00 00    	je     219e <subdir+0x6a2>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    1e9f:	83 ec 0c             	sub    $0xc,%esp
    1ea2:	68 fd 44 00 00       	push   $0x44fd
    1ea7:	e8 67 19 00 00       	call   3813 <chdir>
    1eac:	83 c4 10             	add    $0x10,%esp
    1eaf:	85 c0                	test   %eax,%eax
    1eb1:	0f 84 fb 02 00 00    	je     21b2 <subdir+0x6b6>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    1eb7:	83 ec 0c             	sub    $0xc,%esp
    1eba:	68 b2 43 00 00       	push   $0x43b2
    1ebf:	e8 2f 19 00 00       	call   37f3 <unlink>
    1ec4:	83 c4 10             	add    $0x10,%esp
    1ec7:	85 c0                	test   %eax,%eax
    1ec9:	0f 85 f7 02 00 00    	jne    21c6 <subdir+0x6ca>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    1ecf:	83 ec 0c             	sub    $0xc,%esp
    1ed2:	68 51 43 00 00       	push   $0x4351
    1ed7:	e8 17 19 00 00       	call   37f3 <unlink>
    1edc:	83 c4 10             	add    $0x10,%esp
    1edf:	85 c0                	test   %eax,%eax
    1ee1:	0f 85 f3 02 00 00    	jne    21da <subdir+0x6de>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    1ee7:	83 ec 0c             	sub    $0xc,%esp
    1eea:	68 18 44 00 00       	push   $0x4418
    1eef:	e8 ff 18 00 00       	call   37f3 <unlink>
    1ef4:	83 c4 10             	add    $0x10,%esp
    1ef7:	85 c0                	test   %eax,%eax
    1ef9:	0f 84 ef 02 00 00    	je     21ee <subdir+0x6f2>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    1eff:	83 ec 0c             	sub    $0xc,%esp
    1f02:	68 2d 43 00 00       	push   $0x432d
    1f07:	e8 e7 18 00 00       	call   37f3 <unlink>
    1f0c:	83 c4 10             	add    $0x10,%esp
    1f0f:	85 c0                	test   %eax,%eax
    1f11:	0f 88 eb 02 00 00    	js     2202 <subdir+0x706>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    1f17:	83 ec 0c             	sub    $0xc,%esp
    1f1a:	68 18 44 00 00       	push   $0x4418
    1f1f:	e8 cf 18 00 00       	call   37f3 <unlink>
    1f24:	83 c4 10             	add    $0x10,%esp
    1f27:	85 c0                	test   %eax,%eax
    1f29:	0f 88 e7 02 00 00    	js     2216 <subdir+0x71a>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    1f2f:	83 ec 08             	sub    $0x8,%esp
    1f32:	68 fa 45 00 00       	push   $0x45fa
    1f37:	6a 01                	push   $0x1
    1f39:	e8 ba 19 00 00       	call   38f8 <printf>
}
    1f3e:	83 c4 10             	add    $0x10,%esp
    1f41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1f44:	c9                   	leave  
    1f45:	c3                   	ret    
    printf(1, "subdir mkdir dd failed\n");
    1f46:	83 ec 08             	sub    $0x8,%esp
    1f49:	68 ff 42 00 00       	push   $0x42ff
    1f4e:	6a 01                	push   $0x1
    1f50:	e8 a3 19 00 00       	call   38f8 <printf>
    exit();
    1f55:	e8 49 18 00 00       	call   37a3 <exit>
    printf(1, "create dd/ff failed\n");
    1f5a:	83 ec 08             	sub    $0x8,%esp
    1f5d:	68 17 43 00 00       	push   $0x4317
    1f62:	6a 01                	push   $0x1
    1f64:	e8 8f 19 00 00       	call   38f8 <printf>
    exit();
    1f69:	e8 35 18 00 00       	call   37a3 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1f6e:	83 ec 08             	sub    $0x8,%esp
    1f71:	68 e4 4d 00 00       	push   $0x4de4
    1f76:	6a 01                	push   $0x1
    1f78:	e8 7b 19 00 00       	call   38f8 <printf>
    exit();
    1f7d:	e8 21 18 00 00       	call   37a3 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    1f82:	83 ec 08             	sub    $0x8,%esp
    1f85:	68 33 43 00 00       	push   $0x4333
    1f8a:	6a 01                	push   $0x1
    1f8c:	e8 67 19 00 00       	call   38f8 <printf>
    exit();
    1f91:	e8 0d 18 00 00       	call   37a3 <exit>
    printf(1, "create dd/dd/ff failed\n");
    1f96:	83 ec 08             	sub    $0x8,%esp
    1f99:	68 57 43 00 00       	push   $0x4357
    1f9e:	6a 01                	push   $0x1
    1fa0:	e8 53 19 00 00       	call   38f8 <printf>
    exit();
    1fa5:	e8 f9 17 00 00       	call   37a3 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    1faa:	83 ec 08             	sub    $0x8,%esp
    1fad:	68 7e 43 00 00       	push   $0x437e
    1fb2:	6a 01                	push   $0x1
    1fb4:	e8 3f 19 00 00       	call   38f8 <printf>
    exit();
    1fb9:	e8 e5 17 00 00       	call   37a3 <exit>
    printf(1, "dd/dd/../ff wrong content\n");
    1fbe:	83 ec 08             	sub    $0x8,%esp
    1fc1:	68 97 43 00 00       	push   $0x4397
    1fc6:	6a 01                	push   $0x1
    1fc8:	e8 2b 19 00 00       	call   38f8 <printf>
    exit();
    1fcd:	e8 d1 17 00 00       	call   37a3 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1fd2:	83 ec 08             	sub    $0x8,%esp
    1fd5:	68 0c 4e 00 00       	push   $0x4e0c
    1fda:	6a 01                	push   $0x1
    1fdc:	e8 17 19 00 00       	call   38f8 <printf>
    exit();
    1fe1:	e8 bd 17 00 00       	call   37a3 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    1fe6:	83 ec 08             	sub    $0x8,%esp
    1fe9:	68 bd 43 00 00       	push   $0x43bd
    1fee:	6a 01                	push   $0x1
    1ff0:	e8 03 19 00 00       	call   38f8 <printf>
    exit();
    1ff5:	e8 a9 17 00 00       	call   37a3 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1ffa:	83 ec 08             	sub    $0x8,%esp
    1ffd:	68 30 4e 00 00       	push   $0x4e30
    2002:	6a 01                	push   $0x1
    2004:	e8 ef 18 00 00       	call   38f8 <printf>
    exit();
    2009:	e8 95 17 00 00       	call   37a3 <exit>
    printf(1, "chdir dd failed\n");
    200e:	83 ec 08             	sub    $0x8,%esp
    2011:	68 d5 43 00 00       	push   $0x43d5
    2016:	6a 01                	push   $0x1
    2018:	e8 db 18 00 00       	call   38f8 <printf>
    exit();
    201d:	e8 81 17 00 00       	call   37a3 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2022:	83 ec 08             	sub    $0x8,%esp
    2025:	68 f2 43 00 00       	push   $0x43f2
    202a:	6a 01                	push   $0x1
    202c:	e8 c7 18 00 00       	call   38f8 <printf>
    exit();
    2031:	e8 6d 17 00 00       	call   37a3 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    2036:	83 ec 08             	sub    $0x8,%esp
    2039:	68 f2 43 00 00       	push   $0x43f2
    203e:	6a 01                	push   $0x1
    2040:	e8 b3 18 00 00       	call   38f8 <printf>
    exit();
    2045:	e8 59 17 00 00       	call   37a3 <exit>
    printf(1, "chdir ./.. failed\n");
    204a:	83 ec 08             	sub    $0x8,%esp
    204d:	68 20 44 00 00       	push   $0x4420
    2052:	6a 01                	push   $0x1
    2054:	e8 9f 18 00 00       	call   38f8 <printf>
    exit();
    2059:	e8 45 17 00 00       	call   37a3 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    205e:	83 ec 08             	sub    $0x8,%esp
    2061:	68 33 44 00 00       	push   $0x4433
    2066:	6a 01                	push   $0x1
    2068:	e8 8b 18 00 00       	call   38f8 <printf>
    exit();
    206d:	e8 31 17 00 00       	call   37a3 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    2072:	83 ec 08             	sub    $0x8,%esp
    2075:	68 4b 44 00 00       	push   $0x444b
    207a:	6a 01                	push   $0x1
    207c:	e8 77 18 00 00       	call   38f8 <printf>
    exit();
    2081:	e8 1d 17 00 00       	call   37a3 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2086:	83 ec 08             	sub    $0x8,%esp
    2089:	68 54 4e 00 00       	push   $0x4e54
    208e:	6a 01                	push   $0x1
    2090:	e8 63 18 00 00       	call   38f8 <printf>
    exit();
    2095:	e8 09 17 00 00       	call   37a3 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    209a:	83 ec 08             	sub    $0x8,%esp
    209d:	68 6f 44 00 00       	push   $0x446f
    20a2:	6a 01                	push   $0x1
    20a4:	e8 4f 18 00 00       	call   38f8 <printf>
    exit();
    20a9:	e8 f5 16 00 00       	call   37a3 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    20ae:	83 ec 08             	sub    $0x8,%esp
    20b1:	68 94 44 00 00       	push   $0x4494
    20b6:	6a 01                	push   $0x1
    20b8:	e8 3b 18 00 00       	call   38f8 <printf>
    exit();
    20bd:	e8 e1 16 00 00       	call   37a3 <exit>
    printf(1, "create dd succeeded!\n");
    20c2:	83 ec 08             	sub    $0x8,%esp
    20c5:	68 b0 44 00 00       	push   $0x44b0
    20ca:	6a 01                	push   $0x1
    20cc:	e8 27 18 00 00       	call   38f8 <printf>
    exit();
    20d1:	e8 cd 16 00 00       	call   37a3 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    20d6:	83 ec 08             	sub    $0x8,%esp
    20d9:	68 c6 44 00 00       	push   $0x44c6
    20de:	6a 01                	push   $0x1
    20e0:	e8 13 18 00 00       	call   38f8 <printf>
    exit();
    20e5:	e8 b9 16 00 00       	call   37a3 <exit>
    printf(1, "open dd wronly succeeded!\n");
    20ea:	83 ec 08             	sub    $0x8,%esp
    20ed:	68 df 44 00 00       	push   $0x44df
    20f2:	6a 01                	push   $0x1
    20f4:	e8 ff 17 00 00       	call   38f8 <printf>
    exit();
    20f9:	e8 a5 16 00 00       	call   37a3 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    20fe:	83 ec 08             	sub    $0x8,%esp
    2101:	68 7c 4e 00 00       	push   $0x4e7c
    2106:	6a 01                	push   $0x1
    2108:	e8 eb 17 00 00       	call   38f8 <printf>
    exit();
    210d:	e8 91 16 00 00       	call   37a3 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2112:	83 ec 08             	sub    $0x8,%esp
    2115:	68 a0 4e 00 00       	push   $0x4ea0
    211a:	6a 01                	push   $0x1
    211c:	e8 d7 17 00 00       	call   38f8 <printf>
    exit();
    2121:	e8 7d 16 00 00       	call   37a3 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2126:	83 ec 08             	sub    $0x8,%esp
    2129:	68 c4 4e 00 00       	push   $0x4ec4
    212e:	6a 01                	push   $0x1
    2130:	e8 c3 17 00 00       	call   38f8 <printf>
    exit();
    2135:	e8 69 16 00 00       	call   37a3 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    213a:	83 ec 08             	sub    $0x8,%esp
    213d:	68 03 45 00 00       	push   $0x4503
    2142:	6a 01                	push   $0x1
    2144:	e8 af 17 00 00       	call   38f8 <printf>
    exit();
    2149:	e8 55 16 00 00       	call   37a3 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    214e:	83 ec 08             	sub    $0x8,%esp
    2151:	68 1e 45 00 00       	push   $0x451e
    2156:	6a 01                	push   $0x1
    2158:	e8 9b 17 00 00       	call   38f8 <printf>
    exit();
    215d:	e8 41 16 00 00       	call   37a3 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2162:	83 ec 08             	sub    $0x8,%esp
    2165:	68 39 45 00 00       	push   $0x4539
    216a:	6a 01                	push   $0x1
    216c:	e8 87 17 00 00       	call   38f8 <printf>
    exit();
    2171:	e8 2d 16 00 00       	call   37a3 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2176:	83 ec 08             	sub    $0x8,%esp
    2179:	68 56 45 00 00       	push   $0x4556
    217e:	6a 01                	push   $0x1
    2180:	e8 73 17 00 00       	call   38f8 <printf>
    exit();
    2185:	e8 19 16 00 00       	call   37a3 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    218a:	83 ec 08             	sub    $0x8,%esp
    218d:	68 72 45 00 00       	push   $0x4572
    2192:	6a 01                	push   $0x1
    2194:	e8 5f 17 00 00       	call   38f8 <printf>
    exit();
    2199:	e8 05 16 00 00       	call   37a3 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    219e:	83 ec 08             	sub    $0x8,%esp
    21a1:	68 8e 45 00 00       	push   $0x458e
    21a6:	6a 01                	push   $0x1
    21a8:	e8 4b 17 00 00       	call   38f8 <printf>
    exit();
    21ad:	e8 f1 15 00 00       	call   37a3 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    21b2:	83 ec 08             	sub    $0x8,%esp
    21b5:	68 a6 45 00 00       	push   $0x45a6
    21ba:	6a 01                	push   $0x1
    21bc:	e8 37 17 00 00       	call   38f8 <printf>
    exit();
    21c1:	e8 dd 15 00 00       	call   37a3 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    21c6:	83 ec 08             	sub    $0x8,%esp
    21c9:	68 bd 43 00 00       	push   $0x43bd
    21ce:	6a 01                	push   $0x1
    21d0:	e8 23 17 00 00       	call   38f8 <printf>
    exit();
    21d5:	e8 c9 15 00 00       	call   37a3 <exit>
    printf(1, "unlink dd/ff failed\n");
    21da:	83 ec 08             	sub    $0x8,%esp
    21dd:	68 be 45 00 00       	push   $0x45be
    21e2:	6a 01                	push   $0x1
    21e4:	e8 0f 17 00 00       	call   38f8 <printf>
    exit();
    21e9:	e8 b5 15 00 00       	call   37a3 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    21ee:	83 ec 08             	sub    $0x8,%esp
    21f1:	68 e8 4e 00 00       	push   $0x4ee8
    21f6:	6a 01                	push   $0x1
    21f8:	e8 fb 16 00 00       	call   38f8 <printf>
    exit();
    21fd:	e8 a1 15 00 00       	call   37a3 <exit>
    printf(1, "unlink dd/dd failed\n");
    2202:	83 ec 08             	sub    $0x8,%esp
    2205:	68 d3 45 00 00       	push   $0x45d3
    220a:	6a 01                	push   $0x1
    220c:	e8 e7 16 00 00       	call   38f8 <printf>
    exit();
    2211:	e8 8d 15 00 00       	call   37a3 <exit>
    printf(1, "unlink dd failed\n");
    2216:	83 ec 08             	sub    $0x8,%esp
    2219:	68 e8 45 00 00       	push   $0x45e8
    221e:	6a 01                	push   $0x1
    2220:	e8 d3 16 00 00       	call   38f8 <printf>
    exit();
    2225:	e8 79 15 00 00       	call   37a3 <exit>

0000222a <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    222a:	55                   	push   %ebp
    222b:	89 e5                	mov    %esp,%ebp
    222d:	57                   	push   %edi
    222e:	56                   	push   %esi
    222f:	53                   	push   %ebx
    2230:	83 ec 14             	sub    $0x14,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    2233:	68 05 46 00 00       	push   $0x4605
    2238:	6a 01                	push   $0x1
    223a:	e8 b9 16 00 00       	call   38f8 <printf>

  unlink("bigwrite");
    223f:	c7 04 24 14 46 00 00 	movl   $0x4614,(%esp)
    2246:	e8 a8 15 00 00       	call   37f3 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    224b:	83 c4 10             	add    $0x10,%esp
    224e:	be f3 01 00 00       	mov    $0x1f3,%esi
    2253:	eb 45                	jmp    229a <bigwrite+0x70>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2255:	83 ec 08             	sub    $0x8,%esp
    2258:	68 1d 46 00 00       	push   $0x461d
    225d:	6a 01                	push   $0x1
    225f:	e8 94 16 00 00       	call   38f8 <printf>
      exit();
    2264:	e8 3a 15 00 00       	call   37a3 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    2269:	50                   	push   %eax
    226a:	56                   	push   %esi
    226b:	68 35 46 00 00       	push   $0x4635
    2270:	6a 01                	push   $0x1
    2272:	e8 81 16 00 00       	call   38f8 <printf>
        exit();
    2277:	e8 27 15 00 00       	call   37a3 <exit>
      }
    }
    close(fd);
    227c:	83 ec 0c             	sub    $0xc,%esp
    227f:	57                   	push   %edi
    2280:	e8 46 15 00 00       	call   37cb <close>
    unlink("bigwrite");
    2285:	c7 04 24 14 46 00 00 	movl   $0x4614,(%esp)
    228c:	e8 62 15 00 00       	call   37f3 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2291:	81 c6 d7 01 00 00    	add    $0x1d7,%esi
    2297:	83 c4 10             	add    $0x10,%esp
    229a:	81 fe ff 17 00 00    	cmp    $0x17ff,%esi
    22a0:	7f 40                	jg     22e2 <bigwrite+0xb8>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    22a2:	83 ec 08             	sub    $0x8,%esp
    22a5:	68 02 02 00 00       	push   $0x202
    22aa:	68 14 46 00 00       	push   $0x4614
    22af:	e8 2f 15 00 00       	call   37e3 <open>
    22b4:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    22b6:	83 c4 10             	add    $0x10,%esp
    22b9:	85 c0                	test   %eax,%eax
    22bb:	78 98                	js     2255 <bigwrite+0x2b>
    for(i = 0; i < 2; i++){
    22bd:	bb 00 00 00 00       	mov    $0x0,%ebx
    22c2:	83 fb 01             	cmp    $0x1,%ebx
    22c5:	7f b5                	jg     227c <bigwrite+0x52>
      int cc = write(fd, buf, sz);
    22c7:	83 ec 04             	sub    $0x4,%esp
    22ca:	56                   	push   %esi
    22cb:	68 20 84 00 00       	push   $0x8420
    22d0:	57                   	push   %edi
    22d1:	e8 ed 14 00 00       	call   37c3 <write>
      if(cc != sz){
    22d6:	83 c4 10             	add    $0x10,%esp
    22d9:	39 c6                	cmp    %eax,%esi
    22db:	75 8c                	jne    2269 <bigwrite+0x3f>
    for(i = 0; i < 2; i++){
    22dd:	83 c3 01             	add    $0x1,%ebx
    22e0:	eb e0                	jmp    22c2 <bigwrite+0x98>
  }

  printf(1, "bigwrite ok\n");
    22e2:	83 ec 08             	sub    $0x8,%esp
    22e5:	68 47 46 00 00       	push   $0x4647
    22ea:	6a 01                	push   $0x1
    22ec:	e8 07 16 00 00       	call   38f8 <printf>
}
    22f1:	83 c4 10             	add    $0x10,%esp
    22f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    22f7:	5b                   	pop    %ebx
    22f8:	5e                   	pop    %esi
    22f9:	5f                   	pop    %edi
    22fa:	5d                   	pop    %ebp
    22fb:	c3                   	ret    

000022fc <bigfile>:

void
bigfile(void)
{
    22fc:	55                   	push   %ebp
    22fd:	89 e5                	mov    %esp,%ebp
    22ff:	57                   	push   %edi
    2300:	56                   	push   %esi
    2301:	53                   	push   %ebx
    2302:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2305:	68 54 46 00 00       	push   $0x4654
    230a:	6a 01                	push   $0x1
    230c:	e8 e7 15 00 00       	call   38f8 <printf>

  unlink("bigfile");
    2311:	c7 04 24 70 46 00 00 	movl   $0x4670,(%esp)
    2318:	e8 d6 14 00 00       	call   37f3 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    231d:	83 c4 08             	add    $0x8,%esp
    2320:	68 02 02 00 00       	push   $0x202
    2325:	68 70 46 00 00       	push   $0x4670
    232a:	e8 b4 14 00 00       	call   37e3 <open>
  if(fd < 0){
    232f:	83 c4 10             	add    $0x10,%esp
    2332:	85 c0                	test   %eax,%eax
    2334:	78 41                	js     2377 <bigfile+0x7b>
    2336:	89 c6                	mov    %eax,%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    2338:	bb 00 00 00 00       	mov    $0x0,%ebx
    233d:	83 fb 13             	cmp    $0x13,%ebx
    2340:	7f 5d                	jg     239f <bigfile+0xa3>
    memset(buf, i, 600);
    2342:	83 ec 04             	sub    $0x4,%esp
    2345:	68 58 02 00 00       	push   $0x258
    234a:	53                   	push   %ebx
    234b:	68 20 84 00 00       	push   $0x8420
    2350:	e8 88 12 00 00       	call   35dd <memset>
    if(write(fd, buf, 600) != 600){
    2355:	83 c4 0c             	add    $0xc,%esp
    2358:	68 58 02 00 00       	push   $0x258
    235d:	68 20 84 00 00       	push   $0x8420
    2362:	56                   	push   %esi
    2363:	e8 5b 14 00 00       	call   37c3 <write>
    2368:	83 c4 10             	add    $0x10,%esp
    236b:	3d 58 02 00 00       	cmp    $0x258,%eax
    2370:	75 19                	jne    238b <bigfile+0x8f>
  for(i = 0; i < 20; i++){
    2372:	83 c3 01             	add    $0x1,%ebx
    2375:	eb c6                	jmp    233d <bigfile+0x41>
    printf(1, "cannot create bigfile");
    2377:	83 ec 08             	sub    $0x8,%esp
    237a:	68 62 46 00 00       	push   $0x4662
    237f:	6a 01                	push   $0x1
    2381:	e8 72 15 00 00       	call   38f8 <printf>
    exit();
    2386:	e8 18 14 00 00       	call   37a3 <exit>
      printf(1, "write bigfile failed\n");
    238b:	83 ec 08             	sub    $0x8,%esp
    238e:	68 78 46 00 00       	push   $0x4678
    2393:	6a 01                	push   $0x1
    2395:	e8 5e 15 00 00       	call   38f8 <printf>
      exit();
    239a:	e8 04 14 00 00       	call   37a3 <exit>
    }
  }
  close(fd);
    239f:	83 ec 0c             	sub    $0xc,%esp
    23a2:	56                   	push   %esi
    23a3:	e8 23 14 00 00       	call   37cb <close>

  fd = open("bigfile", 0);
    23a8:	83 c4 08             	add    $0x8,%esp
    23ab:	6a 00                	push   $0x0
    23ad:	68 70 46 00 00       	push   $0x4670
    23b2:	e8 2c 14 00 00       	call   37e3 <open>
    23b7:	89 c7                	mov    %eax,%edi
  if(fd < 0){
    23b9:	83 c4 10             	add    $0x10,%esp
    23bc:	85 c0                	test   %eax,%eax
    23be:	78 53                	js     2413 <bigfile+0x117>
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
    23c0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; ; i++){
    23c5:	bb 00 00 00 00       	mov    $0x0,%ebx
    cc = read(fd, buf, 300);
    23ca:	83 ec 04             	sub    $0x4,%esp
    23cd:	68 2c 01 00 00       	push   $0x12c
    23d2:	68 20 84 00 00       	push   $0x8420
    23d7:	57                   	push   %edi
    23d8:	e8 de 13 00 00       	call   37bb <read>
    if(cc < 0){
    23dd:	83 c4 10             	add    $0x10,%esp
    23e0:	85 c0                	test   %eax,%eax
    23e2:	78 43                	js     2427 <bigfile+0x12b>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    23e4:	74 7d                	je     2463 <bigfile+0x167>
      break;
    if(cc != 300){
    23e6:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    23eb:	75 4e                	jne    243b <bigfile+0x13f>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    23ed:	0f be 0d 20 84 00 00 	movsbl 0x8420,%ecx
    23f4:	89 da                	mov    %ebx,%edx
    23f6:	c1 ea 1f             	shr    $0x1f,%edx
    23f9:	01 da                	add    %ebx,%edx
    23fb:	d1 fa                	sar    %edx
    23fd:	39 d1                	cmp    %edx,%ecx
    23ff:	75 4e                	jne    244f <bigfile+0x153>
    2401:	0f be 0d 4b 85 00 00 	movsbl 0x854b,%ecx
    2408:	39 ca                	cmp    %ecx,%edx
    240a:	75 43                	jne    244f <bigfile+0x153>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    240c:	01 c6                	add    %eax,%esi
  for(i = 0; ; i++){
    240e:	83 c3 01             	add    $0x1,%ebx
    cc = read(fd, buf, 300);
    2411:	eb b7                	jmp    23ca <bigfile+0xce>
    printf(1, "cannot open bigfile\n");
    2413:	83 ec 08             	sub    $0x8,%esp
    2416:	68 8e 46 00 00       	push   $0x468e
    241b:	6a 01                	push   $0x1
    241d:	e8 d6 14 00 00       	call   38f8 <printf>
    exit();
    2422:	e8 7c 13 00 00       	call   37a3 <exit>
      printf(1, "read bigfile failed\n");
    2427:	83 ec 08             	sub    $0x8,%esp
    242a:	68 a3 46 00 00       	push   $0x46a3
    242f:	6a 01                	push   $0x1
    2431:	e8 c2 14 00 00       	call   38f8 <printf>
      exit();
    2436:	e8 68 13 00 00       	call   37a3 <exit>
      printf(1, "short read bigfile\n");
    243b:	83 ec 08             	sub    $0x8,%esp
    243e:	68 b8 46 00 00       	push   $0x46b8
    2443:	6a 01                	push   $0x1
    2445:	e8 ae 14 00 00       	call   38f8 <printf>
      exit();
    244a:	e8 54 13 00 00       	call   37a3 <exit>
      printf(1, "read bigfile wrong data\n");
    244f:	83 ec 08             	sub    $0x8,%esp
    2452:	68 cc 46 00 00       	push   $0x46cc
    2457:	6a 01                	push   $0x1
    2459:	e8 9a 14 00 00       	call   38f8 <printf>
      exit();
    245e:	e8 40 13 00 00       	call   37a3 <exit>
  }
  close(fd);
    2463:	83 ec 0c             	sub    $0xc,%esp
    2466:	57                   	push   %edi
    2467:	e8 5f 13 00 00       	call   37cb <close>
  if(total != 20*600){
    246c:	83 c4 10             	add    $0x10,%esp
    246f:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    2475:	75 27                	jne    249e <bigfile+0x1a2>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    2477:	83 ec 0c             	sub    $0xc,%esp
    247a:	68 70 46 00 00       	push   $0x4670
    247f:	e8 6f 13 00 00       	call   37f3 <unlink>

  printf(1, "bigfile test ok\n");
    2484:	83 c4 08             	add    $0x8,%esp
    2487:	68 ff 46 00 00       	push   $0x46ff
    248c:	6a 01                	push   $0x1
    248e:	e8 65 14 00 00       	call   38f8 <printf>
}
    2493:	83 c4 10             	add    $0x10,%esp
    2496:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2499:	5b                   	pop    %ebx
    249a:	5e                   	pop    %esi
    249b:	5f                   	pop    %edi
    249c:	5d                   	pop    %ebp
    249d:	c3                   	ret    
    printf(1, "read bigfile wrong total\n");
    249e:	83 ec 08             	sub    $0x8,%esp
    24a1:	68 e5 46 00 00       	push   $0x46e5
    24a6:	6a 01                	push   $0x1
    24a8:	e8 4b 14 00 00       	call   38f8 <printf>
    exit();
    24ad:	e8 f1 12 00 00       	call   37a3 <exit>

000024b2 <fourteen>:

void
fourteen(void)
{
    24b2:	55                   	push   %ebp
    24b3:	89 e5                	mov    %esp,%ebp
    24b5:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    24b8:	68 10 47 00 00       	push   $0x4710
    24bd:	6a 01                	push   $0x1
    24bf:	e8 34 14 00 00       	call   38f8 <printf>

  if(mkdir("12345678901234") != 0){
    24c4:	c7 04 24 4b 47 00 00 	movl   $0x474b,(%esp)
    24cb:	e8 3b 13 00 00       	call   380b <mkdir>
    24d0:	83 c4 10             	add    $0x10,%esp
    24d3:	85 c0                	test   %eax,%eax
    24d5:	0f 85 9c 00 00 00    	jne    2577 <fourteen+0xc5>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    24db:	83 ec 0c             	sub    $0xc,%esp
    24de:	68 08 4f 00 00       	push   $0x4f08
    24e3:	e8 23 13 00 00       	call   380b <mkdir>
    24e8:	83 c4 10             	add    $0x10,%esp
    24eb:	85 c0                	test   %eax,%eax
    24ed:	0f 85 98 00 00 00    	jne    258b <fourteen+0xd9>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    24f3:	83 ec 08             	sub    $0x8,%esp
    24f6:	68 00 02 00 00       	push   $0x200
    24fb:	68 58 4f 00 00       	push   $0x4f58
    2500:	e8 de 12 00 00       	call   37e3 <open>
  if(fd < 0){
    2505:	83 c4 10             	add    $0x10,%esp
    2508:	85 c0                	test   %eax,%eax
    250a:	0f 88 8f 00 00 00    	js     259f <fourteen+0xed>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    2510:	83 ec 0c             	sub    $0xc,%esp
    2513:	50                   	push   %eax
    2514:	e8 b2 12 00 00       	call   37cb <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2519:	83 c4 08             	add    $0x8,%esp
    251c:	6a 00                	push   $0x0
    251e:	68 c8 4f 00 00       	push   $0x4fc8
    2523:	e8 bb 12 00 00       	call   37e3 <open>
  if(fd < 0){
    2528:	83 c4 10             	add    $0x10,%esp
    252b:	85 c0                	test   %eax,%eax
    252d:	0f 88 80 00 00 00    	js     25b3 <fourteen+0x101>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    2533:	83 ec 0c             	sub    $0xc,%esp
    2536:	50                   	push   %eax
    2537:	e8 8f 12 00 00       	call   37cb <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    253c:	c7 04 24 3c 47 00 00 	movl   $0x473c,(%esp)
    2543:	e8 c3 12 00 00       	call   380b <mkdir>
    2548:	83 c4 10             	add    $0x10,%esp
    254b:	85 c0                	test   %eax,%eax
    254d:	74 78                	je     25c7 <fourteen+0x115>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    254f:	83 ec 0c             	sub    $0xc,%esp
    2552:	68 64 50 00 00       	push   $0x5064
    2557:	e8 af 12 00 00       	call   380b <mkdir>
    255c:	83 c4 10             	add    $0x10,%esp
    255f:	85 c0                	test   %eax,%eax
    2561:	74 78                	je     25db <fourteen+0x129>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    2563:	83 ec 08             	sub    $0x8,%esp
    2566:	68 5a 47 00 00       	push   $0x475a
    256b:	6a 01                	push   $0x1
    256d:	e8 86 13 00 00       	call   38f8 <printf>
}
    2572:	83 c4 10             	add    $0x10,%esp
    2575:	c9                   	leave  
    2576:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    2577:	83 ec 08             	sub    $0x8,%esp
    257a:	68 1f 47 00 00       	push   $0x471f
    257f:	6a 01                	push   $0x1
    2581:	e8 72 13 00 00       	call   38f8 <printf>
    exit();
    2586:	e8 18 12 00 00       	call   37a3 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    258b:	83 ec 08             	sub    $0x8,%esp
    258e:	68 28 4f 00 00       	push   $0x4f28
    2593:	6a 01                	push   $0x1
    2595:	e8 5e 13 00 00       	call   38f8 <printf>
    exit();
    259a:	e8 04 12 00 00       	call   37a3 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    259f:	83 ec 08             	sub    $0x8,%esp
    25a2:	68 88 4f 00 00       	push   $0x4f88
    25a7:	6a 01                	push   $0x1
    25a9:	e8 4a 13 00 00       	call   38f8 <printf>
    exit();
    25ae:	e8 f0 11 00 00       	call   37a3 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    25b3:	83 ec 08             	sub    $0x8,%esp
    25b6:	68 f8 4f 00 00       	push   $0x4ff8
    25bb:	6a 01                	push   $0x1
    25bd:	e8 36 13 00 00       	call   38f8 <printf>
    exit();
    25c2:	e8 dc 11 00 00       	call   37a3 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    25c7:	83 ec 08             	sub    $0x8,%esp
    25ca:	68 34 50 00 00       	push   $0x5034
    25cf:	6a 01                	push   $0x1
    25d1:	e8 22 13 00 00       	call   38f8 <printf>
    exit();
    25d6:	e8 c8 11 00 00       	call   37a3 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    25db:	83 ec 08             	sub    $0x8,%esp
    25de:	68 84 50 00 00       	push   $0x5084
    25e3:	6a 01                	push   $0x1
    25e5:	e8 0e 13 00 00       	call   38f8 <printf>
    exit();
    25ea:	e8 b4 11 00 00       	call   37a3 <exit>

000025ef <rmdot>:

void
rmdot(void)
{
    25ef:	55                   	push   %ebp
    25f0:	89 e5                	mov    %esp,%ebp
    25f2:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    25f5:	68 67 47 00 00       	push   $0x4767
    25fa:	6a 01                	push   $0x1
    25fc:	e8 f7 12 00 00       	call   38f8 <printf>
  if(mkdir("dots") != 0){
    2601:	c7 04 24 73 47 00 00 	movl   $0x4773,(%esp)
    2608:	e8 fe 11 00 00       	call   380b <mkdir>
    260d:	83 c4 10             	add    $0x10,%esp
    2610:	85 c0                	test   %eax,%eax
    2612:	0f 85 bc 00 00 00    	jne    26d4 <rmdot+0xe5>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    2618:	83 ec 0c             	sub    $0xc,%esp
    261b:	68 73 47 00 00       	push   $0x4773
    2620:	e8 ee 11 00 00       	call   3813 <chdir>
    2625:	83 c4 10             	add    $0x10,%esp
    2628:	85 c0                	test   %eax,%eax
    262a:	0f 85 b8 00 00 00    	jne    26e8 <rmdot+0xf9>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2630:	83 ec 0c             	sub    $0xc,%esp
    2633:	68 1e 44 00 00       	push   $0x441e
    2638:	e8 b6 11 00 00       	call   37f3 <unlink>
    263d:	83 c4 10             	add    $0x10,%esp
    2640:	85 c0                	test   %eax,%eax
    2642:	0f 84 b4 00 00 00    	je     26fc <rmdot+0x10d>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2648:	83 ec 0c             	sub    $0xc,%esp
    264b:	68 1d 44 00 00       	push   $0x441d
    2650:	e8 9e 11 00 00       	call   37f3 <unlink>
    2655:	83 c4 10             	add    $0x10,%esp
    2658:	85 c0                	test   %eax,%eax
    265a:	0f 84 b0 00 00 00    	je     2710 <rmdot+0x121>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2660:	83 ec 0c             	sub    $0xc,%esp
    2663:	68 f1 3b 00 00       	push   $0x3bf1
    2668:	e8 a6 11 00 00       	call   3813 <chdir>
    266d:	83 c4 10             	add    $0x10,%esp
    2670:	85 c0                	test   %eax,%eax
    2672:	0f 85 ac 00 00 00    	jne    2724 <rmdot+0x135>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2678:	83 ec 0c             	sub    $0xc,%esp
    267b:	68 bb 47 00 00       	push   $0x47bb
    2680:	e8 6e 11 00 00       	call   37f3 <unlink>
    2685:	83 c4 10             	add    $0x10,%esp
    2688:	85 c0                	test   %eax,%eax
    268a:	0f 84 a8 00 00 00    	je     2738 <rmdot+0x149>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    2690:	83 ec 0c             	sub    $0xc,%esp
    2693:	68 d9 47 00 00       	push   $0x47d9
    2698:	e8 56 11 00 00       	call   37f3 <unlink>
    269d:	83 c4 10             	add    $0x10,%esp
    26a0:	85 c0                	test   %eax,%eax
    26a2:	0f 84 a4 00 00 00    	je     274c <rmdot+0x15d>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    26a8:	83 ec 0c             	sub    $0xc,%esp
    26ab:	68 73 47 00 00       	push   $0x4773
    26b0:	e8 3e 11 00 00       	call   37f3 <unlink>
    26b5:	83 c4 10             	add    $0x10,%esp
    26b8:	85 c0                	test   %eax,%eax
    26ba:	0f 85 a0 00 00 00    	jne    2760 <rmdot+0x171>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    26c0:	83 ec 08             	sub    $0x8,%esp
    26c3:	68 0e 48 00 00       	push   $0x480e
    26c8:	6a 01                	push   $0x1
    26ca:	e8 29 12 00 00       	call   38f8 <printf>
}
    26cf:	83 c4 10             	add    $0x10,%esp
    26d2:	c9                   	leave  
    26d3:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    26d4:	83 ec 08             	sub    $0x8,%esp
    26d7:	68 78 47 00 00       	push   $0x4778
    26dc:	6a 01                	push   $0x1
    26de:	e8 15 12 00 00       	call   38f8 <printf>
    exit();
    26e3:	e8 bb 10 00 00       	call   37a3 <exit>
    printf(1, "chdir dots failed\n");
    26e8:	83 ec 08             	sub    $0x8,%esp
    26eb:	68 8b 47 00 00       	push   $0x478b
    26f0:	6a 01                	push   $0x1
    26f2:	e8 01 12 00 00       	call   38f8 <printf>
    exit();
    26f7:	e8 a7 10 00 00       	call   37a3 <exit>
    printf(1, "rm . worked!\n");
    26fc:	83 ec 08             	sub    $0x8,%esp
    26ff:	68 9e 47 00 00       	push   $0x479e
    2704:	6a 01                	push   $0x1
    2706:	e8 ed 11 00 00       	call   38f8 <printf>
    exit();
    270b:	e8 93 10 00 00       	call   37a3 <exit>
    printf(1, "rm .. worked!\n");
    2710:	83 ec 08             	sub    $0x8,%esp
    2713:	68 ac 47 00 00       	push   $0x47ac
    2718:	6a 01                	push   $0x1
    271a:	e8 d9 11 00 00       	call   38f8 <printf>
    exit();
    271f:	e8 7f 10 00 00       	call   37a3 <exit>
    printf(1, "chdir / failed\n");
    2724:	83 ec 08             	sub    $0x8,%esp
    2727:	68 f3 3b 00 00       	push   $0x3bf3
    272c:	6a 01                	push   $0x1
    272e:	e8 c5 11 00 00       	call   38f8 <printf>
    exit();
    2733:	e8 6b 10 00 00       	call   37a3 <exit>
    printf(1, "unlink dots/. worked!\n");
    2738:	83 ec 08             	sub    $0x8,%esp
    273b:	68 c2 47 00 00       	push   $0x47c2
    2740:	6a 01                	push   $0x1
    2742:	e8 b1 11 00 00       	call   38f8 <printf>
    exit();
    2747:	e8 57 10 00 00       	call   37a3 <exit>
    printf(1, "unlink dots/.. worked!\n");
    274c:	83 ec 08             	sub    $0x8,%esp
    274f:	68 e1 47 00 00       	push   $0x47e1
    2754:	6a 01                	push   $0x1
    2756:	e8 9d 11 00 00       	call   38f8 <printf>
    exit();
    275b:	e8 43 10 00 00       	call   37a3 <exit>
    printf(1, "unlink dots failed!\n");
    2760:	83 ec 08             	sub    $0x8,%esp
    2763:	68 f9 47 00 00       	push   $0x47f9
    2768:	6a 01                	push   $0x1
    276a:	e8 89 11 00 00       	call   38f8 <printf>
    exit();
    276f:	e8 2f 10 00 00       	call   37a3 <exit>

00002774 <dirfile>:

void
dirfile(void)
{
    2774:	55                   	push   %ebp
    2775:	89 e5                	mov    %esp,%ebp
    2777:	53                   	push   %ebx
    2778:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    277b:	68 18 48 00 00       	push   $0x4818
    2780:	6a 01                	push   $0x1
    2782:	e8 71 11 00 00       	call   38f8 <printf>

  fd = open("dirfile", O_CREATE);
    2787:	83 c4 08             	add    $0x8,%esp
    278a:	68 00 02 00 00       	push   $0x200
    278f:	68 25 48 00 00       	push   $0x4825
    2794:	e8 4a 10 00 00       	call   37e3 <open>
  if(fd < 0){
    2799:	83 c4 10             	add    $0x10,%esp
    279c:	85 c0                	test   %eax,%eax
    279e:	0f 88 22 01 00 00    	js     28c6 <dirfile+0x152>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    27a4:	83 ec 0c             	sub    $0xc,%esp
    27a7:	50                   	push   %eax
    27a8:	e8 1e 10 00 00       	call   37cb <close>
  if(chdir("dirfile") == 0){
    27ad:	c7 04 24 25 48 00 00 	movl   $0x4825,(%esp)
    27b4:	e8 5a 10 00 00       	call   3813 <chdir>
    27b9:	83 c4 10             	add    $0x10,%esp
    27bc:	85 c0                	test   %eax,%eax
    27be:	0f 84 16 01 00 00    	je     28da <dirfile+0x166>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    27c4:	83 ec 08             	sub    $0x8,%esp
    27c7:	6a 00                	push   $0x0
    27c9:	68 5e 48 00 00       	push   $0x485e
    27ce:	e8 10 10 00 00       	call   37e3 <open>
  if(fd >= 0){
    27d3:	83 c4 10             	add    $0x10,%esp
    27d6:	85 c0                	test   %eax,%eax
    27d8:	0f 89 10 01 00 00    	jns    28ee <dirfile+0x17a>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    27de:	83 ec 08             	sub    $0x8,%esp
    27e1:	68 00 02 00 00       	push   $0x200
    27e6:	68 5e 48 00 00       	push   $0x485e
    27eb:	e8 f3 0f 00 00       	call   37e3 <open>
  if(fd >= 0){
    27f0:	83 c4 10             	add    $0x10,%esp
    27f3:	85 c0                	test   %eax,%eax
    27f5:	0f 89 07 01 00 00    	jns    2902 <dirfile+0x18e>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    27fb:	83 ec 0c             	sub    $0xc,%esp
    27fe:	68 5e 48 00 00       	push   $0x485e
    2803:	e8 03 10 00 00       	call   380b <mkdir>
    2808:	83 c4 10             	add    $0x10,%esp
    280b:	85 c0                	test   %eax,%eax
    280d:	0f 84 03 01 00 00    	je     2916 <dirfile+0x1a2>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    2813:	83 ec 0c             	sub    $0xc,%esp
    2816:	68 5e 48 00 00       	push   $0x485e
    281b:	e8 d3 0f 00 00       	call   37f3 <unlink>
    2820:	83 c4 10             	add    $0x10,%esp
    2823:	85 c0                	test   %eax,%eax
    2825:	0f 84 ff 00 00 00    	je     292a <dirfile+0x1b6>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    282b:	83 ec 08             	sub    $0x8,%esp
    282e:	68 5e 48 00 00       	push   $0x485e
    2833:	68 c2 48 00 00       	push   $0x48c2
    2838:	e8 c6 0f 00 00       	call   3803 <link>
    283d:	83 c4 10             	add    $0x10,%esp
    2840:	85 c0                	test   %eax,%eax
    2842:	0f 84 f6 00 00 00    	je     293e <dirfile+0x1ca>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2848:	83 ec 0c             	sub    $0xc,%esp
    284b:	68 25 48 00 00       	push   $0x4825
    2850:	e8 9e 0f 00 00       	call   37f3 <unlink>
    2855:	83 c4 10             	add    $0x10,%esp
    2858:	85 c0                	test   %eax,%eax
    285a:	0f 85 f2 00 00 00    	jne    2952 <dirfile+0x1de>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2860:	83 ec 08             	sub    $0x8,%esp
    2863:	6a 02                	push   $0x2
    2865:	68 1e 44 00 00       	push   $0x441e
    286a:	e8 74 0f 00 00       	call   37e3 <open>
  if(fd >= 0){
    286f:	83 c4 10             	add    $0x10,%esp
    2872:	85 c0                	test   %eax,%eax
    2874:	0f 89 ec 00 00 00    	jns    2966 <dirfile+0x1f2>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    287a:	83 ec 08             	sub    $0x8,%esp
    287d:	6a 00                	push   $0x0
    287f:	68 1e 44 00 00       	push   $0x441e
    2884:	e8 5a 0f 00 00       	call   37e3 <open>
    2889:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    288b:	83 c4 0c             	add    $0xc,%esp
    288e:	6a 01                	push   $0x1
    2890:	68 01 45 00 00       	push   $0x4501
    2895:	50                   	push   %eax
    2896:	e8 28 0f 00 00       	call   37c3 <write>
    289b:	83 c4 10             	add    $0x10,%esp
    289e:	85 c0                	test   %eax,%eax
    28a0:	0f 8f d4 00 00 00    	jg     297a <dirfile+0x206>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    28a6:	83 ec 0c             	sub    $0xc,%esp
    28a9:	53                   	push   %ebx
    28aa:	e8 1c 0f 00 00       	call   37cb <close>

  printf(1, "dir vs file OK\n");
    28af:	83 c4 08             	add    $0x8,%esp
    28b2:	68 f5 48 00 00       	push   $0x48f5
    28b7:	6a 01                	push   $0x1
    28b9:	e8 3a 10 00 00       	call   38f8 <printf>
}
    28be:	83 c4 10             	add    $0x10,%esp
    28c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    28c4:	c9                   	leave  
    28c5:	c3                   	ret    
    printf(1, "create dirfile failed\n");
    28c6:	83 ec 08             	sub    $0x8,%esp
    28c9:	68 2d 48 00 00       	push   $0x482d
    28ce:	6a 01                	push   $0x1
    28d0:	e8 23 10 00 00       	call   38f8 <printf>
    exit();
    28d5:	e8 c9 0e 00 00       	call   37a3 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    28da:	83 ec 08             	sub    $0x8,%esp
    28dd:	68 44 48 00 00       	push   $0x4844
    28e2:	6a 01                	push   $0x1
    28e4:	e8 0f 10 00 00       	call   38f8 <printf>
    exit();
    28e9:	e8 b5 0e 00 00       	call   37a3 <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    28ee:	83 ec 08             	sub    $0x8,%esp
    28f1:	68 69 48 00 00       	push   $0x4869
    28f6:	6a 01                	push   $0x1
    28f8:	e8 fb 0f 00 00       	call   38f8 <printf>
    exit();
    28fd:	e8 a1 0e 00 00       	call   37a3 <exit>
    printf(1, "create dirfile/xx succeeded!\n");
    2902:	83 ec 08             	sub    $0x8,%esp
    2905:	68 69 48 00 00       	push   $0x4869
    290a:	6a 01                	push   $0x1
    290c:	e8 e7 0f 00 00       	call   38f8 <printf>
    exit();
    2911:	e8 8d 0e 00 00       	call   37a3 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2916:	83 ec 08             	sub    $0x8,%esp
    2919:	68 87 48 00 00       	push   $0x4887
    291e:	6a 01                	push   $0x1
    2920:	e8 d3 0f 00 00       	call   38f8 <printf>
    exit();
    2925:	e8 79 0e 00 00       	call   37a3 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    292a:	83 ec 08             	sub    $0x8,%esp
    292d:	68 a4 48 00 00       	push   $0x48a4
    2932:	6a 01                	push   $0x1
    2934:	e8 bf 0f 00 00       	call   38f8 <printf>
    exit();
    2939:	e8 65 0e 00 00       	call   37a3 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    293e:	83 ec 08             	sub    $0x8,%esp
    2941:	68 b8 50 00 00       	push   $0x50b8
    2946:	6a 01                	push   $0x1
    2948:	e8 ab 0f 00 00       	call   38f8 <printf>
    exit();
    294d:	e8 51 0e 00 00       	call   37a3 <exit>
    printf(1, "unlink dirfile failed!\n");
    2952:	83 ec 08             	sub    $0x8,%esp
    2955:	68 c9 48 00 00       	push   $0x48c9
    295a:	6a 01                	push   $0x1
    295c:	e8 97 0f 00 00       	call   38f8 <printf>
    exit();
    2961:	e8 3d 0e 00 00       	call   37a3 <exit>
    printf(1, "open . for writing succeeded!\n");
    2966:	83 ec 08             	sub    $0x8,%esp
    2969:	68 d8 50 00 00       	push   $0x50d8
    296e:	6a 01                	push   $0x1
    2970:	e8 83 0f 00 00       	call   38f8 <printf>
    exit();
    2975:	e8 29 0e 00 00       	call   37a3 <exit>
    printf(1, "write . succeeded!\n");
    297a:	83 ec 08             	sub    $0x8,%esp
    297d:	68 e1 48 00 00       	push   $0x48e1
    2982:	6a 01                	push   $0x1
    2984:	e8 6f 0f 00 00       	call   38f8 <printf>
    exit();
    2989:	e8 15 0e 00 00       	call   37a3 <exit>

0000298e <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    298e:	55                   	push   %ebp
    298f:	89 e5                	mov    %esp,%ebp
    2991:	53                   	push   %ebx
    2992:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2995:	68 05 49 00 00       	push   $0x4905
    299a:	6a 01                	push   $0x1
    299c:	e8 57 0f 00 00       	call   38f8 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    29a1:	83 c4 10             	add    $0x10,%esp
    29a4:	bb 00 00 00 00       	mov    $0x0,%ebx
    29a9:	eb 4c                	jmp    29f7 <iref+0x69>
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    29ab:	83 ec 08             	sub    $0x8,%esp
    29ae:	68 1c 49 00 00       	push   $0x491c
    29b3:	6a 01                	push   $0x1
    29b5:	e8 3e 0f 00 00       	call   38f8 <printf>
      exit();
    29ba:	e8 e4 0d 00 00       	call   37a3 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    29bf:	83 ec 08             	sub    $0x8,%esp
    29c2:	68 30 49 00 00       	push   $0x4930
    29c7:	6a 01                	push   $0x1
    29c9:	e8 2a 0f 00 00       	call   38f8 <printf>
      exit();
    29ce:	e8 d0 0d 00 00       	call   37a3 <exit>

    mkdir("");
    link("README", "");
    fd = open("", O_CREATE);
    if(fd >= 0)
      close(fd);
    29d3:	83 ec 0c             	sub    $0xc,%esp
    29d6:	50                   	push   %eax
    29d7:	e8 ef 0d 00 00       	call   37cb <close>
    29dc:	83 c4 10             	add    $0x10,%esp
    29df:	e9 80 00 00 00       	jmp    2a64 <iref+0xd6>
    fd = open("xx", O_CREATE);
    if(fd >= 0)
      close(fd);
    unlink("xx");
    29e4:	83 ec 0c             	sub    $0xc,%esp
    29e7:	68 00 45 00 00       	push   $0x4500
    29ec:	e8 02 0e 00 00       	call   37f3 <unlink>
  for(i = 0; i < 50 + 1; i++){
    29f1:	83 c3 01             	add    $0x1,%ebx
    29f4:	83 c4 10             	add    $0x10,%esp
    29f7:	83 fb 32             	cmp    $0x32,%ebx
    29fa:	0f 8f 92 00 00 00    	jg     2a92 <iref+0x104>
    if(mkdir("irefd") != 0){
    2a00:	83 ec 0c             	sub    $0xc,%esp
    2a03:	68 16 49 00 00       	push   $0x4916
    2a08:	e8 fe 0d 00 00       	call   380b <mkdir>
    2a0d:	83 c4 10             	add    $0x10,%esp
    2a10:	85 c0                	test   %eax,%eax
    2a12:	75 97                	jne    29ab <iref+0x1d>
    if(chdir("irefd") != 0){
    2a14:	83 ec 0c             	sub    $0xc,%esp
    2a17:	68 16 49 00 00       	push   $0x4916
    2a1c:	e8 f2 0d 00 00       	call   3813 <chdir>
    2a21:	83 c4 10             	add    $0x10,%esp
    2a24:	85 c0                	test   %eax,%eax
    2a26:	75 97                	jne    29bf <iref+0x31>
    mkdir("");
    2a28:	83 ec 0c             	sub    $0xc,%esp
    2a2b:	68 cb 3f 00 00       	push   $0x3fcb
    2a30:	e8 d6 0d 00 00       	call   380b <mkdir>
    link("README", "");
    2a35:	83 c4 08             	add    $0x8,%esp
    2a38:	68 cb 3f 00 00       	push   $0x3fcb
    2a3d:	68 c2 48 00 00       	push   $0x48c2
    2a42:	e8 bc 0d 00 00       	call   3803 <link>
    fd = open("", O_CREATE);
    2a47:	83 c4 08             	add    $0x8,%esp
    2a4a:	68 00 02 00 00       	push   $0x200
    2a4f:	68 cb 3f 00 00       	push   $0x3fcb
    2a54:	e8 8a 0d 00 00       	call   37e3 <open>
    if(fd >= 0)
    2a59:	83 c4 10             	add    $0x10,%esp
    2a5c:	85 c0                	test   %eax,%eax
    2a5e:	0f 89 6f ff ff ff    	jns    29d3 <iref+0x45>
    fd = open("xx", O_CREATE);
    2a64:	83 ec 08             	sub    $0x8,%esp
    2a67:	68 00 02 00 00       	push   $0x200
    2a6c:	68 00 45 00 00       	push   $0x4500
    2a71:	e8 6d 0d 00 00       	call   37e3 <open>
    if(fd >= 0)
    2a76:	83 c4 10             	add    $0x10,%esp
    2a79:	85 c0                	test   %eax,%eax
    2a7b:	0f 88 63 ff ff ff    	js     29e4 <iref+0x56>
      close(fd);
    2a81:	83 ec 0c             	sub    $0xc,%esp
    2a84:	50                   	push   %eax
    2a85:	e8 41 0d 00 00       	call   37cb <close>
    2a8a:	83 c4 10             	add    $0x10,%esp
    2a8d:	e9 52 ff ff ff       	jmp    29e4 <iref+0x56>
  }

  chdir("/");
    2a92:	83 ec 0c             	sub    $0xc,%esp
    2a95:	68 f1 3b 00 00       	push   $0x3bf1
    2a9a:	e8 74 0d 00 00       	call   3813 <chdir>
  printf(1, "empty file name OK\n");
    2a9f:	83 c4 08             	add    $0x8,%esp
    2aa2:	68 44 49 00 00       	push   $0x4944
    2aa7:	6a 01                	push   $0x1
    2aa9:	e8 4a 0e 00 00       	call   38f8 <printf>
}
    2aae:	83 c4 10             	add    $0x10,%esp
    2ab1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ab4:	c9                   	leave  
    2ab5:	c3                   	ret    

00002ab6 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2ab6:	55                   	push   %ebp
    2ab7:	89 e5                	mov    %esp,%ebp
    2ab9:	53                   	push   %ebx
    2aba:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2abd:	68 58 49 00 00       	push   $0x4958
    2ac2:	6a 01                	push   $0x1
    2ac4:	e8 2f 0e 00 00       	call   38f8 <printf>

  for(n=0; n<1000; n++){
    2ac9:	83 c4 10             	add    $0x10,%esp
    2acc:	bb 00 00 00 00       	mov    $0x0,%ebx
    2ad1:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
    2ad7:	7f 15                	jg     2aee <forktest+0x38>
    pid = fork();
    2ad9:	e8 bd 0c 00 00       	call   379b <fork>
    if(pid < 0)
    2ade:	85 c0                	test   %eax,%eax
    2ae0:	78 0c                	js     2aee <forktest+0x38>
      break;
    if(pid == 0)
    2ae2:	74 05                	je     2ae9 <forktest+0x33>
  for(n=0; n<1000; n++){
    2ae4:	83 c3 01             	add    $0x1,%ebx
    2ae7:	eb e8                	jmp    2ad1 <forktest+0x1b>
      exit();
    2ae9:	e8 b5 0c 00 00       	call   37a3 <exit>
  }

  if(n == 1000){
    2aee:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2af4:	74 12                	je     2b08 <forktest+0x52>
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2af6:	85 db                	test   %ebx,%ebx
    2af8:	7e 36                	jle    2b30 <forktest+0x7a>
    if(wait() < 0){
    2afa:	e8 ac 0c 00 00       	call   37ab <wait>
    2aff:	85 c0                	test   %eax,%eax
    2b01:	78 19                	js     2b1c <forktest+0x66>
  for(; n > 0; n--){
    2b03:	83 eb 01             	sub    $0x1,%ebx
    2b06:	eb ee                	jmp    2af6 <forktest+0x40>
    printf(1, "fork claimed to work 1000 times!\n");
    2b08:	83 ec 08             	sub    $0x8,%esp
    2b0b:	68 f8 50 00 00       	push   $0x50f8
    2b10:	6a 01                	push   $0x1
    2b12:	e8 e1 0d 00 00       	call   38f8 <printf>
    exit();
    2b17:	e8 87 0c 00 00       	call   37a3 <exit>
      printf(1, "wait stopped early\n");
    2b1c:	83 ec 08             	sub    $0x8,%esp
    2b1f:	68 63 49 00 00       	push   $0x4963
    2b24:	6a 01                	push   $0x1
    2b26:	e8 cd 0d 00 00       	call   38f8 <printf>
      exit();
    2b2b:	e8 73 0c 00 00       	call   37a3 <exit>
    }
  }

  if(wait() != -1){
    2b30:	e8 76 0c 00 00       	call   37ab <wait>
    2b35:	83 f8 ff             	cmp    $0xffffffff,%eax
    2b38:	75 17                	jne    2b51 <forktest+0x9b>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2b3a:	83 ec 08             	sub    $0x8,%esp
    2b3d:	68 8a 49 00 00       	push   $0x498a
    2b42:	6a 01                	push   $0x1
    2b44:	e8 af 0d 00 00       	call   38f8 <printf>
}
    2b49:	83 c4 10             	add    $0x10,%esp
    2b4c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b4f:	c9                   	leave  
    2b50:	c3                   	ret    
    printf(1, "wait got too many\n");
    2b51:	83 ec 08             	sub    $0x8,%esp
    2b54:	68 77 49 00 00       	push   $0x4977
    2b59:	6a 01                	push   $0x1
    2b5b:	e8 98 0d 00 00       	call   38f8 <printf>
    exit();
    2b60:	e8 3e 0c 00 00       	call   37a3 <exit>

00002b65 <sbrktest>:

void
sbrktest(void)
{
    2b65:	55                   	push   %ebp
    2b66:	89 e5                	mov    %esp,%ebp
    2b68:	57                   	push   %edi
    2b69:	56                   	push   %esi
    2b6a:	53                   	push   %ebx
    2b6b:	83 ec 54             	sub    $0x54,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2b6e:	68 98 49 00 00       	push   $0x4998
    2b73:	ff 35 d4 5c 00 00    	push   0x5cd4
    2b79:	e8 7a 0d 00 00       	call   38f8 <printf>
  oldbrk = sbrk(0);
    2b7e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b85:	e8 a1 0c 00 00       	call   382b <sbrk>
    2b8a:	89 c7                	mov    %eax,%edi

  // can one sbrk() less than a page?
  a = sbrk(0);
    2b8c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b93:	e8 93 0c 00 00       	call   382b <sbrk>
    2b98:	89 c6                	mov    %eax,%esi
  int i;
  for(i = 0; i < 5000; i++){
    2b9a:	83 c4 10             	add    $0x10,%esp
    2b9d:	bb 00 00 00 00       	mov    $0x0,%ebx
    2ba2:	81 fb 87 13 00 00    	cmp    $0x1387,%ebx
    2ba8:	7f 3a                	jg     2be4 <sbrktest+0x7f>
    b = sbrk(1);
    2baa:	83 ec 0c             	sub    $0xc,%esp
    2bad:	6a 01                	push   $0x1
    2baf:	e8 77 0c 00 00       	call   382b <sbrk>
    if(b != a){
    2bb4:	83 c4 10             	add    $0x10,%esp
    2bb7:	39 c6                	cmp    %eax,%esi
    2bb9:	75 0b                	jne    2bc6 <sbrktest+0x61>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2bbb:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    2bbe:	8d 70 01             	lea    0x1(%eax),%esi
  for(i = 0; i < 5000; i++){
    2bc1:	83 c3 01             	add    $0x1,%ebx
    2bc4:	eb dc                	jmp    2ba2 <sbrktest+0x3d>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2bc6:	83 ec 0c             	sub    $0xc,%esp
    2bc9:	50                   	push   %eax
    2bca:	56                   	push   %esi
    2bcb:	53                   	push   %ebx
    2bcc:	68 a3 49 00 00       	push   $0x49a3
    2bd1:	ff 35 d4 5c 00 00    	push   0x5cd4
    2bd7:	e8 1c 0d 00 00       	call   38f8 <printf>
      exit();
    2bdc:	83 c4 20             	add    $0x20,%esp
    2bdf:	e8 bf 0b 00 00       	call   37a3 <exit>
  }
  pid = fork();
    2be4:	e8 b2 0b 00 00       	call   379b <fork>
    2be9:	89 c3                	mov    %eax,%ebx
  if(pid < 0){
    2beb:	85 c0                	test   %eax,%eax
    2bed:	0f 88 4c 01 00 00    	js     2d3f <sbrktest+0x1da>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2bf3:	83 ec 0c             	sub    $0xc,%esp
    2bf6:	6a 01                	push   $0x1
    2bf8:	e8 2e 0c 00 00       	call   382b <sbrk>
  c = sbrk(1);
    2bfd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c04:	e8 22 0c 00 00       	call   382b <sbrk>
  if(c != a + 1){
    2c09:	83 c6 01             	add    $0x1,%esi
    2c0c:	83 c4 10             	add    $0x10,%esp
    2c0f:	39 c6                	cmp    %eax,%esi
    2c11:	0f 85 40 01 00 00    	jne    2d57 <sbrktest+0x1f2>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2c17:	85 db                	test   %ebx,%ebx
    2c19:	0f 84 50 01 00 00    	je     2d6f <sbrktest+0x20a>
    exit();
  wait();
    2c1f:	e8 87 0b 00 00       	call   37ab <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2c24:	83 ec 0c             	sub    $0xc,%esp
    2c27:	6a 00                	push   $0x0
    2c29:	e8 fd 0b 00 00       	call   382b <sbrk>
    2c2e:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2c30:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2c35:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2c37:	89 04 24             	mov    %eax,(%esp)
    2c3a:	e8 ec 0b 00 00       	call   382b <sbrk>
  if (p != a) {
    2c3f:	83 c4 10             	add    $0x10,%esp
    2c42:	39 c3                	cmp    %eax,%ebx
    2c44:	0f 85 2a 01 00 00    	jne    2d74 <sbrktest+0x20f>
  }
  lastaddr = (char*) (BIG-1);
  //*lastaddr = 99; // Remzi: Why doesn't this work anymore?

  // can one de-allocate?
  a = sbrk(0);
    2c4a:	83 ec 0c             	sub    $0xc,%esp
    2c4d:	6a 00                	push   $0x0
    2c4f:	e8 d7 0b 00 00       	call   382b <sbrk>
    2c54:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2c56:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2c5d:	e8 c9 0b 00 00       	call   382b <sbrk>
  if(c == (char*)0xffffffff){
    2c62:	83 c4 10             	add    $0x10,%esp
    2c65:	83 f8 ff             	cmp    $0xffffffff,%eax
    2c68:	0f 84 1e 01 00 00    	je     2d8c <sbrktest+0x227>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2c6e:	83 ec 0c             	sub    $0xc,%esp
    2c71:	6a 00                	push   $0x0
    2c73:	e8 b3 0b 00 00       	call   382b <sbrk>
  if(c != a - 4096){
    2c78:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2c7e:	83 c4 10             	add    $0x10,%esp
    2c81:	39 c2                	cmp    %eax,%edx
    2c83:	0f 85 1b 01 00 00    	jne    2da4 <sbrktest+0x23f>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2c89:	83 ec 0c             	sub    $0xc,%esp
    2c8c:	6a 00                	push   $0x0
    2c8e:	e8 98 0b 00 00       	call   382b <sbrk>
    2c93:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2c95:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2c9c:	e8 8a 0b 00 00       	call   382b <sbrk>
    2ca1:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    2ca3:	83 c4 10             	add    $0x10,%esp
    2ca6:	39 c3                	cmp    %eax,%ebx
    2ca8:	0f 85 0d 01 00 00    	jne    2dbb <sbrktest+0x256>
    2cae:	83 ec 0c             	sub    $0xc,%esp
    2cb1:	6a 00                	push   $0x0
    2cb3:	e8 73 0b 00 00       	call   382b <sbrk>
    2cb8:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2cbe:	83 c4 10             	add    $0x10,%esp
    2cc1:	39 c2                	cmp    %eax,%edx
    2cc3:	0f 85 f2 00 00 00    	jne    2dbb <sbrktest+0x256>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2cc9:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2cd0:	0f 84 fc 00 00 00    	je     2dd2 <sbrktest+0x26d>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2cd6:	83 ec 0c             	sub    $0xc,%esp
    2cd9:	6a 00                	push   $0x0
    2cdb:	e8 4b 0b 00 00       	call   382b <sbrk>
    2ce0:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2ce2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ce9:	e8 3d 0b 00 00       	call   382b <sbrk>
    2cee:	89 c2                	mov    %eax,%edx
    2cf0:	89 f8                	mov    %edi,%eax
    2cf2:	29 d0                	sub    %edx,%eax
    2cf4:	89 04 24             	mov    %eax,(%esp)
    2cf7:	e8 2f 0b 00 00       	call   382b <sbrk>
  if(c != a){
    2cfc:	83 c4 10             	add    $0x10,%esp
    2cff:	39 c3                	cmp    %eax,%ebx
    2d01:	0f 85 e3 00 00 00    	jne    2dea <sbrktest+0x285>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2d07:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2d0c:	81 fb 7f 84 1e 80    	cmp    $0x801e847f,%ebx
    2d12:	0f 87 23 01 00 00    	ja     2e3b <sbrktest+0x2d6>
    ppid = getpid();
    2d18:	e8 06 0b 00 00       	call   3823 <getpid>
    2d1d:	89 c6                	mov    %eax,%esi
    pid = fork();
    2d1f:	e8 77 0a 00 00       	call   379b <fork>
    if(pid < 0){
    2d24:	85 c0                	test   %eax,%eax
    2d26:	0f 88 d5 00 00 00    	js     2e01 <sbrktest+0x29c>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2d2c:	0f 84 e7 00 00 00    	je     2e19 <sbrktest+0x2b4>
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2d32:	e8 74 0a 00 00       	call   37ab <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2d37:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    2d3d:	eb cd                	jmp    2d0c <sbrktest+0x1a7>
    printf(stdout, "sbrk test fork failed\n");
    2d3f:	83 ec 08             	sub    $0x8,%esp
    2d42:	68 be 49 00 00       	push   $0x49be
    2d47:	ff 35 d4 5c 00 00    	push   0x5cd4
    2d4d:	e8 a6 0b 00 00       	call   38f8 <printf>
    exit();
    2d52:	e8 4c 0a 00 00       	call   37a3 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    2d57:	83 ec 08             	sub    $0x8,%esp
    2d5a:	68 d5 49 00 00       	push   $0x49d5
    2d5f:	ff 35 d4 5c 00 00    	push   0x5cd4
    2d65:	e8 8e 0b 00 00       	call   38f8 <printf>
    exit();
    2d6a:	e8 34 0a 00 00       	call   37a3 <exit>
    exit();
    2d6f:	e8 2f 0a 00 00       	call   37a3 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2d74:	83 ec 08             	sub    $0x8,%esp
    2d77:	68 1c 51 00 00       	push   $0x511c
    2d7c:	ff 35 d4 5c 00 00    	push   0x5cd4
    2d82:	e8 71 0b 00 00       	call   38f8 <printf>
    exit();
    2d87:	e8 17 0a 00 00       	call   37a3 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    2d8c:	83 ec 08             	sub    $0x8,%esp
    2d8f:	68 f1 49 00 00       	push   $0x49f1
    2d94:	ff 35 d4 5c 00 00    	push   0x5cd4
    2d9a:	e8 59 0b 00 00       	call   38f8 <printf>
    exit();
    2d9f:	e8 ff 09 00 00       	call   37a3 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2da4:	50                   	push   %eax
    2da5:	53                   	push   %ebx
    2da6:	68 5c 51 00 00       	push   $0x515c
    2dab:	ff 35 d4 5c 00 00    	push   0x5cd4
    2db1:	e8 42 0b 00 00       	call   38f8 <printf>
    exit();
    2db6:	e8 e8 09 00 00       	call   37a3 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2dbb:	56                   	push   %esi
    2dbc:	53                   	push   %ebx
    2dbd:	68 94 51 00 00       	push   $0x5194
    2dc2:	ff 35 d4 5c 00 00    	push   0x5cd4
    2dc8:	e8 2b 0b 00 00       	call   38f8 <printf>
    exit();
    2dcd:	e8 d1 09 00 00       	call   37a3 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2dd2:	83 ec 08             	sub    $0x8,%esp
    2dd5:	68 bc 51 00 00       	push   $0x51bc
    2dda:	ff 35 d4 5c 00 00    	push   0x5cd4
    2de0:	e8 13 0b 00 00       	call   38f8 <printf>
    exit();
    2de5:	e8 b9 09 00 00       	call   37a3 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2dea:	50                   	push   %eax
    2deb:	53                   	push   %ebx
    2dec:	68 ec 51 00 00       	push   $0x51ec
    2df1:	ff 35 d4 5c 00 00    	push   0x5cd4
    2df7:	e8 fc 0a 00 00       	call   38f8 <printf>
    exit();
    2dfc:	e8 a2 09 00 00       	call   37a3 <exit>
      printf(stdout, "fork failed\n");
    2e01:	83 ec 08             	sub    $0x8,%esp
    2e04:	68 e9 4a 00 00       	push   $0x4ae9
    2e09:	ff 35 d4 5c 00 00    	push   0x5cd4
    2e0f:	e8 e4 0a 00 00       	call   38f8 <printf>
      exit();
    2e14:	e8 8a 09 00 00       	call   37a3 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2e19:	0f be 03             	movsbl (%ebx),%eax
    2e1c:	50                   	push   %eax
    2e1d:	53                   	push   %ebx
    2e1e:	68 0c 4a 00 00       	push   $0x4a0c
    2e23:	ff 35 d4 5c 00 00    	push   0x5cd4
    2e29:	e8 ca 0a 00 00       	call   38f8 <printf>
      kill(ppid);
    2e2e:	89 34 24             	mov    %esi,(%esp)
    2e31:	e8 9d 09 00 00       	call   37d3 <kill>
      exit();
    2e36:	e8 68 09 00 00       	call   37a3 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2e3b:	83 ec 0c             	sub    $0xc,%esp
    2e3e:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2e41:	50                   	push   %eax
    2e42:	e8 6c 09 00 00       	call   37b3 <pipe>
    2e47:	89 c3                	mov    %eax,%ebx
    2e49:	83 c4 10             	add    $0x10,%esp
    2e4c:	85 c0                	test   %eax,%eax
    2e4e:	75 04                	jne    2e54 <sbrktest+0x2ef>
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2e50:	89 c6                	mov    %eax,%esi
    2e52:	eb 59                	jmp    2ead <sbrktest+0x348>
    printf(1, "pipe() failed\n");
    2e54:	83 ec 08             	sub    $0x8,%esp
    2e57:	68 e1 3e 00 00       	push   $0x3ee1
    2e5c:	6a 01                	push   $0x1
    2e5e:	e8 95 0a 00 00       	call   38f8 <printf>
    exit();
    2e63:	e8 3b 09 00 00       	call   37a3 <exit>
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2e68:	83 ec 0c             	sub    $0xc,%esp
    2e6b:	6a 00                	push   $0x0
    2e6d:	e8 b9 09 00 00       	call   382b <sbrk>
    2e72:	89 c2                	mov    %eax,%edx
    2e74:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e79:	29 d0                	sub    %edx,%eax
    2e7b:	89 04 24             	mov    %eax,(%esp)
    2e7e:	e8 a8 09 00 00       	call   382b <sbrk>
      write(fds[1], "x", 1);
    2e83:	83 c4 0c             	add    $0xc,%esp
    2e86:	6a 01                	push   $0x1
    2e88:	68 01 45 00 00       	push   $0x4501
    2e8d:	ff 75 e4             	push   -0x1c(%ebp)
    2e90:	e8 2e 09 00 00       	call   37c3 <write>
    2e95:	83 c4 10             	add    $0x10,%esp
      // sit around until killed
      for(;;) sleep(1000);
    2e98:	83 ec 0c             	sub    $0xc,%esp
    2e9b:	68 e8 03 00 00       	push   $0x3e8
    2ea0:	e8 8e 09 00 00       	call   3833 <sleep>
    2ea5:	83 c4 10             	add    $0x10,%esp
    2ea8:	eb ee                	jmp    2e98 <sbrktest+0x333>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2eaa:	83 c6 01             	add    $0x1,%esi
    2ead:	83 fe 09             	cmp    $0x9,%esi
    2eb0:	77 28                	ja     2eda <sbrktest+0x375>
    if((pids[i] = fork()) == 0){
    2eb2:	e8 e4 08 00 00       	call   379b <fork>
    2eb7:	89 44 b5 b8          	mov    %eax,-0x48(%ebp,%esi,4)
    2ebb:	85 c0                	test   %eax,%eax
    2ebd:	74 a9                	je     2e68 <sbrktest+0x303>
    }
    if(pids[i] != -1)
    2ebf:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ec2:	74 e6                	je     2eaa <sbrktest+0x345>
      read(fds[0], &scratch, 1);
    2ec4:	83 ec 04             	sub    $0x4,%esp
    2ec7:	6a 01                	push   $0x1
    2ec9:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2ecc:	50                   	push   %eax
    2ecd:	ff 75 e0             	push   -0x20(%ebp)
    2ed0:	e8 e6 08 00 00       	call   37bb <read>
    2ed5:	83 c4 10             	add    $0x10,%esp
    2ed8:	eb d0                	jmp    2eaa <sbrktest+0x345>
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2eda:	83 ec 0c             	sub    $0xc,%esp
    2edd:	68 00 10 00 00       	push   $0x1000
    2ee2:	e8 44 09 00 00       	call   382b <sbrk>
    2ee7:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2ee9:	83 c4 10             	add    $0x10,%esp
    2eec:	eb 03                	jmp    2ef1 <sbrktest+0x38c>
    2eee:	83 c3 01             	add    $0x1,%ebx
    2ef1:	83 fb 09             	cmp    $0x9,%ebx
    2ef4:	77 1c                	ja     2f12 <sbrktest+0x3ad>
    if(pids[i] == -1)
    2ef6:	8b 44 9d b8          	mov    -0x48(%ebp,%ebx,4),%eax
    2efa:	83 f8 ff             	cmp    $0xffffffff,%eax
    2efd:	74 ef                	je     2eee <sbrktest+0x389>
      continue;
    kill(pids[i]);
    2eff:	83 ec 0c             	sub    $0xc,%esp
    2f02:	50                   	push   %eax
    2f03:	e8 cb 08 00 00       	call   37d3 <kill>
    wait();
    2f08:	e8 9e 08 00 00       	call   37ab <wait>
    2f0d:	83 c4 10             	add    $0x10,%esp
    2f10:	eb dc                	jmp    2eee <sbrktest+0x389>
  }
  if(c == (char*)0xffffffff){
    2f12:	83 fe ff             	cmp    $0xffffffff,%esi
    2f15:	74 2f                	je     2f46 <sbrktest+0x3e1>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2f17:	83 ec 0c             	sub    $0xc,%esp
    2f1a:	6a 00                	push   $0x0
    2f1c:	e8 0a 09 00 00       	call   382b <sbrk>
    2f21:	83 c4 10             	add    $0x10,%esp
    2f24:	39 c7                	cmp    %eax,%edi
    2f26:	72 36                	jb     2f5e <sbrktest+0x3f9>
    sbrk(-(sbrk(0) - oldbrk));

  printf(stdout, "sbrk test OK\n");
    2f28:	83 ec 08             	sub    $0x8,%esp
    2f2b:	68 40 4a 00 00       	push   $0x4a40
    2f30:	ff 35 d4 5c 00 00    	push   0x5cd4
    2f36:	e8 bd 09 00 00       	call   38f8 <printf>
}
    2f3b:	83 c4 10             	add    $0x10,%esp
    2f3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2f41:	5b                   	pop    %ebx
    2f42:	5e                   	pop    %esi
    2f43:	5f                   	pop    %edi
    2f44:	5d                   	pop    %ebp
    2f45:	c3                   	ret    
    printf(stdout, "failed sbrk leaked memory\n");
    2f46:	83 ec 08             	sub    $0x8,%esp
    2f49:	68 25 4a 00 00       	push   $0x4a25
    2f4e:	ff 35 d4 5c 00 00    	push   0x5cd4
    2f54:	e8 9f 09 00 00       	call   38f8 <printf>
    exit();
    2f59:	e8 45 08 00 00       	call   37a3 <exit>
    sbrk(-(sbrk(0) - oldbrk));
    2f5e:	83 ec 0c             	sub    $0xc,%esp
    2f61:	6a 00                	push   $0x0
    2f63:	e8 c3 08 00 00       	call   382b <sbrk>
    2f68:	29 c7                	sub    %eax,%edi
    2f6a:	89 3c 24             	mov    %edi,(%esp)
    2f6d:	e8 b9 08 00 00       	call   382b <sbrk>
    2f72:	83 c4 10             	add    $0x10,%esp
    2f75:	eb b1                	jmp    2f28 <sbrktest+0x3c3>

00002f77 <validateint>:
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    2f77:	c3                   	ret    

00002f78 <validatetest>:

void
validatetest(void)
{
    2f78:	55                   	push   %ebp
    2f79:	89 e5                	mov    %esp,%ebp
    2f7b:	56                   	push   %esi
    2f7c:	53                   	push   %ebx
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    2f7d:	83 ec 08             	sub    $0x8,%esp
    2f80:	68 4e 4a 00 00       	push   $0x4a4e
    2f85:	ff 35 d4 5c 00 00    	push   0x5cd4
    2f8b:	e8 68 09 00 00       	call   38f8 <printf>
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    2f90:	83 c4 10             	add    $0x10,%esp
    2f93:	be 00 00 00 00       	mov    $0x0,%esi
    2f98:	81 fe 00 30 11 00    	cmp    $0x113000,%esi
    2f9e:	77 69                	ja     3009 <validatetest+0x91>
    if((pid = fork()) == 0){
    2fa0:	e8 f6 07 00 00       	call   379b <fork>
    2fa5:	89 c3                	mov    %eax,%ebx
    2fa7:	85 c0                	test   %eax,%eax
    2fa9:	74 41                	je     2fec <validatetest+0x74>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    2fab:	83 ec 0c             	sub    $0xc,%esp
    2fae:	6a 00                	push   $0x0
    2fb0:	e8 7e 08 00 00       	call   3833 <sleep>
    sleep(0);
    2fb5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fbc:	e8 72 08 00 00       	call   3833 <sleep>
    kill(pid);
    2fc1:	89 1c 24             	mov    %ebx,(%esp)
    2fc4:	e8 0a 08 00 00       	call   37d3 <kill>
    wait();
    2fc9:	e8 dd 07 00 00       	call   37ab <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    2fce:	83 c4 08             	add    $0x8,%esp
    2fd1:	56                   	push   %esi
    2fd2:	68 5d 4a 00 00       	push   $0x4a5d
    2fd7:	e8 27 08 00 00       	call   3803 <link>
    2fdc:	83 c4 10             	add    $0x10,%esp
    2fdf:	83 f8 ff             	cmp    $0xffffffff,%eax
    2fe2:	75 0d                	jne    2ff1 <validatetest+0x79>
  for(p = 0; p <= (uint)hi; p += 4096){
    2fe4:	81 c6 00 10 00 00    	add    $0x1000,%esi
    2fea:	eb ac                	jmp    2f98 <validatetest+0x20>
      exit();
    2fec:	e8 b2 07 00 00       	call   37a3 <exit>
      printf(stdout, "link should not succeed\n");
    2ff1:	83 ec 08             	sub    $0x8,%esp
    2ff4:	68 68 4a 00 00       	push   $0x4a68
    2ff9:	ff 35 d4 5c 00 00    	push   0x5cd4
    2fff:	e8 f4 08 00 00       	call   38f8 <printf>
      exit();
    3004:	e8 9a 07 00 00       	call   37a3 <exit>
    }
  }

  printf(stdout, "validate ok\n");
    3009:	83 ec 08             	sub    $0x8,%esp
    300c:	68 81 4a 00 00       	push   $0x4a81
    3011:	ff 35 d4 5c 00 00    	push   0x5cd4
    3017:	e8 dc 08 00 00       	call   38f8 <printf>
}
    301c:	83 c4 10             	add    $0x10,%esp
    301f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3022:	5b                   	pop    %ebx
    3023:	5e                   	pop    %esi
    3024:	5d                   	pop    %ebp
    3025:	c3                   	ret    

00003026 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3026:	55                   	push   %ebp
    3027:	89 e5                	mov    %esp,%ebp
    3029:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    302c:	68 8e 4a 00 00       	push   $0x4a8e
    3031:	ff 35 d4 5c 00 00    	push   0x5cd4
    3037:	e8 bc 08 00 00       	call   38f8 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    303c:	83 c4 10             	add    $0x10,%esp
    303f:	b8 00 00 00 00       	mov    $0x0,%eax
    3044:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    3049:	77 26                	ja     3071 <bsstest+0x4b>
    if(uninit[i] != '\0'){
    304b:	80 b8 00 5d 00 00 00 	cmpb   $0x0,0x5d00(%eax)
    3052:	75 05                	jne    3059 <bsstest+0x33>
  for(i = 0; i < sizeof(uninit); i++){
    3054:	83 c0 01             	add    $0x1,%eax
    3057:	eb eb                	jmp    3044 <bsstest+0x1e>
      printf(stdout, "bss test failed\n");
    3059:	83 ec 08             	sub    $0x8,%esp
    305c:	68 98 4a 00 00       	push   $0x4a98
    3061:	ff 35 d4 5c 00 00    	push   0x5cd4
    3067:	e8 8c 08 00 00       	call   38f8 <printf>
      exit();
    306c:	e8 32 07 00 00       	call   37a3 <exit>
    }
  }
  printf(stdout, "bss test ok\n");
    3071:	83 ec 08             	sub    $0x8,%esp
    3074:	68 a9 4a 00 00       	push   $0x4aa9
    3079:	ff 35 d4 5c 00 00    	push   0x5cd4
    307f:	e8 74 08 00 00       	call   38f8 <printf>
}
    3084:	83 c4 10             	add    $0x10,%esp
    3087:	c9                   	leave  
    3088:	c3                   	ret    

00003089 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3089:	55                   	push   %ebp
    308a:	89 e5                	mov    %esp,%ebp
    308c:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    308f:	68 b6 4a 00 00       	push   $0x4ab6
    3094:	e8 5a 07 00 00       	call   37f3 <unlink>
  pid = fork();
    3099:	e8 fd 06 00 00       	call   379b <fork>
  if(pid == 0){
    309e:	83 c4 10             	add    $0x10,%esp
    30a1:	85 c0                	test   %eax,%eax
    30a3:	74 4d                	je     30f2 <bigargtest+0x69>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    30a5:	0f 88 ad 00 00 00    	js     3158 <bigargtest+0xcf>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    30ab:	e8 fb 06 00 00       	call   37ab <wait>
  fd = open("bigarg-ok", 0);
    30b0:	83 ec 08             	sub    $0x8,%esp
    30b3:	6a 00                	push   $0x0
    30b5:	68 b6 4a 00 00       	push   $0x4ab6
    30ba:	e8 24 07 00 00       	call   37e3 <open>
  if(fd < 0){
    30bf:	83 c4 10             	add    $0x10,%esp
    30c2:	85 c0                	test   %eax,%eax
    30c4:	0f 88 a6 00 00 00    	js     3170 <bigargtest+0xe7>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    30ca:	83 ec 0c             	sub    $0xc,%esp
    30cd:	50                   	push   %eax
    30ce:	e8 f8 06 00 00       	call   37cb <close>
  unlink("bigarg-ok");
    30d3:	c7 04 24 b6 4a 00 00 	movl   $0x4ab6,(%esp)
    30da:	e8 14 07 00 00       	call   37f3 <unlink>
}
    30df:	83 c4 10             	add    $0x10,%esp
    30e2:	c9                   	leave  
    30e3:	c3                   	ret    
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    30e4:	c7 04 85 20 a4 00 00 	movl   $0x5210,0xa420(,%eax,4)
    30eb:	10 52 00 00 
    for(i = 0; i < MAXARG-1; i++)
    30ef:	83 c0 01             	add    $0x1,%eax
    30f2:	83 f8 1e             	cmp    $0x1e,%eax
    30f5:	7e ed                	jle    30e4 <bigargtest+0x5b>
    args[MAXARG-1] = 0;
    30f7:	c7 05 9c a4 00 00 00 	movl   $0x0,0xa49c
    30fe:	00 00 00 
    printf(stdout, "bigarg test\n");
    3101:	83 ec 08             	sub    $0x8,%esp
    3104:	68 c0 4a 00 00       	push   $0x4ac0
    3109:	ff 35 d4 5c 00 00    	push   0x5cd4
    310f:	e8 e4 07 00 00       	call   38f8 <printf>
    exec("echo", args);
    3114:	83 c4 08             	add    $0x8,%esp
    3117:	68 20 a4 00 00       	push   $0xa420
    311c:	68 8d 3c 00 00       	push   $0x3c8d
    3121:	e8 b5 06 00 00       	call   37db <exec>
    printf(stdout, "bigarg test ok\n");
    3126:	83 c4 08             	add    $0x8,%esp
    3129:	68 cd 4a 00 00       	push   $0x4acd
    312e:	ff 35 d4 5c 00 00    	push   0x5cd4
    3134:	e8 bf 07 00 00       	call   38f8 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3139:	83 c4 08             	add    $0x8,%esp
    313c:	68 00 02 00 00       	push   $0x200
    3141:	68 b6 4a 00 00       	push   $0x4ab6
    3146:	e8 98 06 00 00       	call   37e3 <open>
    close(fd);
    314b:	89 04 24             	mov    %eax,(%esp)
    314e:	e8 78 06 00 00       	call   37cb <close>
    exit();
    3153:	e8 4b 06 00 00       	call   37a3 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3158:	83 ec 08             	sub    $0x8,%esp
    315b:	68 dd 4a 00 00       	push   $0x4add
    3160:	ff 35 d4 5c 00 00    	push   0x5cd4
    3166:	e8 8d 07 00 00       	call   38f8 <printf>
    exit();
    316b:	e8 33 06 00 00       	call   37a3 <exit>
    printf(stdout, "bigarg test failed!\n");
    3170:	83 ec 08             	sub    $0x8,%esp
    3173:	68 f6 4a 00 00       	push   $0x4af6
    3178:	ff 35 d4 5c 00 00    	push   0x5cd4
    317e:	e8 75 07 00 00       	call   38f8 <printf>
    exit();
    3183:	e8 1b 06 00 00       	call   37a3 <exit>

00003188 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3188:	55                   	push   %ebp
    3189:	89 e5                	mov    %esp,%ebp
    318b:	57                   	push   %edi
    318c:	56                   	push   %esi
    318d:	53                   	push   %ebx
    318e:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    3191:	68 0b 4b 00 00       	push   $0x4b0b
    3196:	6a 01                	push   $0x1
    3198:	e8 5b 07 00 00       	call   38f8 <printf>
    319d:	83 c4 10             	add    $0x10,%esp

  for(nfiles = 0; ; nfiles++){
    31a0:	bb 00 00 00 00       	mov    $0x0,%ebx
    char name[64];
    name[0] = 'f';
    31a5:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    31a9:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    31ae:	89 d8                	mov    %ebx,%eax
    31b0:	f7 ea                	imul   %edx
    31b2:	c1 fa 06             	sar    $0x6,%edx
    31b5:	89 de                	mov    %ebx,%esi
    31b7:	c1 fe 1f             	sar    $0x1f,%esi
    31ba:	29 f2                	sub    %esi,%edx
    31bc:	8d 42 30             	lea    0x30(%edx),%eax
    31bf:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    31c2:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    31c8:	89 d9                	mov    %ebx,%ecx
    31ca:	29 d1                	sub    %edx,%ecx
    31cc:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
    31d1:	89 c8                	mov    %ecx,%eax
    31d3:	f7 ef                	imul   %edi
    31d5:	c1 fa 05             	sar    $0x5,%edx
    31d8:	c1 f9 1f             	sar    $0x1f,%ecx
    31db:	29 ca                	sub    %ecx,%edx
    31dd:	83 c2 30             	add    $0x30,%edx
    31e0:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    31e3:	89 d8                	mov    %ebx,%eax
    31e5:	f7 ef                	imul   %edi
    31e7:	89 d7                	mov    %edx,%edi
    31e9:	c1 ff 05             	sar    $0x5,%edi
    31ec:	29 f7                	sub    %esi,%edi
    31ee:	6b c7 64             	imul   $0x64,%edi,%eax
    31f1:	89 df                	mov    %ebx,%edi
    31f3:	29 c7                	sub    %eax,%edi
    31f5:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    31fa:	89 f8                	mov    %edi,%eax
    31fc:	f7 e9                	imul   %ecx
    31fe:	c1 fa 02             	sar    $0x2,%edx
    3201:	c1 ff 1f             	sar    $0x1f,%edi
    3204:	29 fa                	sub    %edi,%edx
    3206:	83 c2 30             	add    $0x30,%edx
    3209:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    320c:	89 d8                	mov    %ebx,%eax
    320e:	f7 e9                	imul   %ecx
    3210:	c1 fa 02             	sar    $0x2,%edx
    3213:	29 f2                	sub    %esi,%edx
    3215:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3218:	01 c0                	add    %eax,%eax
    321a:	89 da                	mov    %ebx,%edx
    321c:	29 c2                	sub    %eax,%edx
    321e:	83 c2 30             	add    $0x30,%edx
    3221:	88 55 ac             	mov    %dl,-0x54(%ebp)
    name[5] = '\0';
    3224:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    printf(1, "writing %s\n", name);
    3228:	83 ec 04             	sub    $0x4,%esp
    322b:	8d 75 a8             	lea    -0x58(%ebp),%esi
    322e:	56                   	push   %esi
    322f:	68 18 4b 00 00       	push   $0x4b18
    3234:	6a 01                	push   $0x1
    3236:	e8 bd 06 00 00       	call   38f8 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    323b:	83 c4 08             	add    $0x8,%esp
    323e:	68 02 02 00 00       	push   $0x202
    3243:	56                   	push   %esi
    3244:	e8 9a 05 00 00       	call   37e3 <open>
    3249:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    324b:	83 c4 10             	add    $0x10,%esp
    324e:	85 c0                	test   %eax,%eax
    3250:	79 1b                	jns    326d <fsfull+0xe5>
      printf(1, "open %s failed\n", name);
    3252:	83 ec 04             	sub    $0x4,%esp
    3255:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3258:	50                   	push   %eax
    3259:	68 24 4b 00 00       	push   $0x4b24
    325e:	6a 01                	push   $0x1
    3260:	e8 93 06 00 00       	call   38f8 <printf>
      break;
    3265:	83 c4 10             	add    $0x10,%esp
    3268:	e9 e6 00 00 00       	jmp    3353 <fsfull+0x1cb>
    }
    int total = 0;
    326d:	bf 00 00 00 00       	mov    $0x0,%edi
    while(1){
      int cc = write(fd, buf, 512);
    3272:	83 ec 04             	sub    $0x4,%esp
    3275:	68 00 02 00 00       	push   $0x200
    327a:	68 20 84 00 00       	push   $0x8420
    327f:	56                   	push   %esi
    3280:	e8 3e 05 00 00       	call   37c3 <write>
      if(cc < 512)
    3285:	83 c4 10             	add    $0x10,%esp
    3288:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    328d:	7e 04                	jle    3293 <fsfull+0x10b>
        break;
      total += cc;
    328f:	01 c7                	add    %eax,%edi
    while(1){
    3291:	eb df                	jmp    3272 <fsfull+0xea>
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3293:	83 ec 04             	sub    $0x4,%esp
    3296:	57                   	push   %edi
    3297:	68 34 4b 00 00       	push   $0x4b34
    329c:	6a 01                	push   $0x1
    329e:	e8 55 06 00 00       	call   38f8 <printf>
    close(fd);
    32a3:	89 34 24             	mov    %esi,(%esp)
    32a6:	e8 20 05 00 00       	call   37cb <close>
    if(total == 0)
    32ab:	83 c4 10             	add    $0x10,%esp
    32ae:	85 ff                	test   %edi,%edi
    32b0:	0f 84 9d 00 00 00    	je     3353 <fsfull+0x1cb>
  for(nfiles = 0; ; nfiles++){
    32b6:	83 c3 01             	add    $0x1,%ebx
    32b9:	e9 e7 fe ff ff       	jmp    31a5 <fsfull+0x1d>
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    32be:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    32c2:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    32c7:	89 d8                	mov    %ebx,%eax
    32c9:	f7 ea                	imul   %edx
    32cb:	c1 fa 06             	sar    $0x6,%edx
    32ce:	89 de                	mov    %ebx,%esi
    32d0:	c1 fe 1f             	sar    $0x1f,%esi
    32d3:	29 f2                	sub    %esi,%edx
    32d5:	8d 42 30             	lea    0x30(%edx),%eax
    32d8:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    32db:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    32e1:	89 d9                	mov    %ebx,%ecx
    32e3:	29 d1                	sub    %edx,%ecx
    32e5:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
    32ea:	89 c8                	mov    %ecx,%eax
    32ec:	f7 ef                	imul   %edi
    32ee:	c1 fa 05             	sar    $0x5,%edx
    32f1:	c1 f9 1f             	sar    $0x1f,%ecx
    32f4:	29 ca                	sub    %ecx,%edx
    32f6:	83 c2 30             	add    $0x30,%edx
    32f9:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    32fc:	89 d8                	mov    %ebx,%eax
    32fe:	f7 ef                	imul   %edi
    3300:	89 d7                	mov    %edx,%edi
    3302:	c1 ff 05             	sar    $0x5,%edi
    3305:	29 f7                	sub    %esi,%edi
    3307:	6b c7 64             	imul   $0x64,%edi,%eax
    330a:	89 df                	mov    %ebx,%edi
    330c:	29 c7                	sub    %eax,%edi
    330e:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    3313:	89 f8                	mov    %edi,%eax
    3315:	f7 e9                	imul   %ecx
    3317:	c1 fa 02             	sar    $0x2,%edx
    331a:	c1 ff 1f             	sar    $0x1f,%edi
    331d:	29 fa                	sub    %edi,%edx
    331f:	83 c2 30             	add    $0x30,%edx
    3322:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3325:	89 d8                	mov    %ebx,%eax
    3327:	f7 e9                	imul   %ecx
    3329:	c1 fa 02             	sar    $0x2,%edx
    332c:	29 f2                	sub    %esi,%edx
    332e:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3331:	01 c0                	add    %eax,%eax
    3333:	89 da                	mov    %ebx,%edx
    3335:	29 c2                	sub    %eax,%edx
    3337:	83 c2 30             	add    $0x30,%edx
    333a:	88 55 ac             	mov    %dl,-0x54(%ebp)
    name[5] = '\0';
    333d:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    unlink(name);
    3341:	83 ec 0c             	sub    $0xc,%esp
    3344:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3347:	50                   	push   %eax
    3348:	e8 a6 04 00 00       	call   37f3 <unlink>
    nfiles--;
    334d:	83 eb 01             	sub    $0x1,%ebx
    3350:	83 c4 10             	add    $0x10,%esp
  while(nfiles >= 0){
    3353:	85 db                	test   %ebx,%ebx
    3355:	0f 89 63 ff ff ff    	jns    32be <fsfull+0x136>
  }

  printf(1, "fsfull test finished\n");
    335b:	83 ec 08             	sub    $0x8,%esp
    335e:	68 44 4b 00 00       	push   $0x4b44
    3363:	6a 01                	push   $0x1
    3365:	e8 8e 05 00 00       	call   38f8 <printf>
}
    336a:	83 c4 10             	add    $0x10,%esp
    336d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3370:	5b                   	pop    %ebx
    3371:	5e                   	pop    %esi
    3372:	5f                   	pop    %edi
    3373:	5d                   	pop    %ebp
    3374:	c3                   	ret    

00003375 <uio>:

void
uio()
{
    3375:	55                   	push   %ebp
    3376:	89 e5                	mov    %esp,%ebp
    3378:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    337b:	68 5a 4b 00 00       	push   $0x4b5a
    3380:	6a 01                	push   $0x1
    3382:	e8 71 05 00 00       	call   38f8 <printf>
  pid = fork();
    3387:	e8 0f 04 00 00       	call   379b <fork>
  if(pid == 0){
    338c:	83 c4 10             	add    $0x10,%esp
    338f:	85 c0                	test   %eax,%eax
    3391:	74 1b                	je     33ae <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    3393:	78 3e                	js     33d3 <uio+0x5e>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    3395:	e8 11 04 00 00       	call   37ab <wait>
  printf(1, "uio test done\n");
    339a:	83 ec 08             	sub    $0x8,%esp
    339d:	68 64 4b 00 00       	push   $0x4b64
    33a2:	6a 01                	push   $0x1
    33a4:	e8 4f 05 00 00       	call   38f8 <printf>
}
    33a9:	83 c4 10             	add    $0x10,%esp
    33ac:	c9                   	leave  
    33ad:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    33ae:	b8 09 00 00 00       	mov    $0x9,%eax
    33b3:	ba 70 00 00 00       	mov    $0x70,%edx
    33b8:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    33b9:	ba 71 00 00 00       	mov    $0x71,%edx
    33be:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    33bf:	83 ec 08             	sub    $0x8,%esp
    33c2:	68 f0 52 00 00       	push   $0x52f0
    33c7:	6a 01                	push   $0x1
    33c9:	e8 2a 05 00 00       	call   38f8 <printf>
    exit();
    33ce:	e8 d0 03 00 00       	call   37a3 <exit>
    printf (1, "fork failed\n");
    33d3:	83 ec 08             	sub    $0x8,%esp
    33d6:	68 e9 4a 00 00       	push   $0x4ae9
    33db:	6a 01                	push   $0x1
    33dd:	e8 16 05 00 00       	call   38f8 <printf>
    exit();
    33e2:	e8 bc 03 00 00       	call   37a3 <exit>

000033e7 <argptest>:

void argptest()
{
    33e7:	55                   	push   %ebp
    33e8:	89 e5                	mov    %esp,%ebp
    33ea:	53                   	push   %ebx
    33eb:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    33ee:	6a 00                	push   $0x0
    33f0:	68 73 4b 00 00       	push   $0x4b73
    33f5:	e8 e9 03 00 00       	call   37e3 <open>
  if (fd < 0) {
    33fa:	83 c4 10             	add    $0x10,%esp
    33fd:	85 c0                	test   %eax,%eax
    33ff:	78 3a                	js     343b <argptest+0x54>
    3401:	89 c3                	mov    %eax,%ebx
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    3403:	83 ec 0c             	sub    $0xc,%esp
    3406:	6a 00                	push   $0x0
    3408:	e8 1e 04 00 00       	call   382b <sbrk>
    340d:	83 e8 01             	sub    $0x1,%eax
    3410:	83 c4 0c             	add    $0xc,%esp
    3413:	6a ff                	push   $0xffffffff
    3415:	50                   	push   %eax
    3416:	53                   	push   %ebx
    3417:	e8 9f 03 00 00       	call   37bb <read>
  close(fd);
    341c:	89 1c 24             	mov    %ebx,(%esp)
    341f:	e8 a7 03 00 00       	call   37cb <close>
  printf(1, "arg test passed\n");
    3424:	83 c4 08             	add    $0x8,%esp
    3427:	68 85 4b 00 00       	push   $0x4b85
    342c:	6a 01                	push   $0x1
    342e:	e8 c5 04 00 00       	call   38f8 <printf>
}
    3433:	83 c4 10             	add    $0x10,%esp
    3436:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3439:	c9                   	leave  
    343a:	c3                   	ret    
    printf(2, "open failed\n");
    343b:	83 ec 08             	sub    $0x8,%esp
    343e:	68 78 4b 00 00       	push   $0x4b78
    3443:	6a 02                	push   $0x2
    3445:	e8 ae 04 00 00       	call   38f8 <printf>
    exit();
    344a:	e8 54 03 00 00       	call   37a3 <exit>

0000344f <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    344f:	69 05 d0 5c 00 00 0d 	imul   $0x19660d,0x5cd0,%eax
    3456:	66 19 00 
    3459:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    345e:	a3 d0 5c 00 00       	mov    %eax,0x5cd0
  return randstate;
}
    3463:	c3                   	ret    

00003464 <main>:

int
main(int argc, char *argv[])
{
    3464:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3468:	83 e4 f0             	and    $0xfffffff0,%esp
    346b:	ff 71 fc             	push   -0x4(%ecx)
    346e:	55                   	push   %ebp
    346f:	89 e5                	mov    %esp,%ebp
    3471:	51                   	push   %ecx
    3472:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
    3475:	68 96 4b 00 00       	push   $0x4b96
    347a:	6a 01                	push   $0x1
    347c:	e8 77 04 00 00       	call   38f8 <printf>

  if(open("usertests.ran", 0) >= 0){
    3481:	83 c4 08             	add    $0x8,%esp
    3484:	6a 00                	push   $0x0
    3486:	68 aa 4b 00 00       	push   $0x4baa
    348b:	e8 53 03 00 00       	call   37e3 <open>
    3490:	83 c4 10             	add    $0x10,%esp
    3493:	85 c0                	test   %eax,%eax
    3495:	78 14                	js     34ab <main+0x47>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3497:	83 ec 08             	sub    $0x8,%esp
    349a:	68 14 53 00 00       	push   $0x5314
    349f:	6a 01                	push   $0x1
    34a1:	e8 52 04 00 00       	call   38f8 <printf>
    exit();
    34a6:	e8 f8 02 00 00       	call   37a3 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    34ab:	83 ec 08             	sub    $0x8,%esp
    34ae:	68 00 02 00 00       	push   $0x200
    34b3:	68 aa 4b 00 00       	push   $0x4baa
    34b8:	e8 26 03 00 00       	call   37e3 <open>
    34bd:	89 04 24             	mov    %eax,(%esp)
    34c0:	e8 06 03 00 00       	call   37cb <close>

  argptest();
    34c5:	e8 1d ff ff ff       	call   33e7 <argptest>
  createdelete();
    34ca:	e8 43 db ff ff       	call   1012 <createdelete>
  linkunlink();
    34cf:	e8 e0 e3 ff ff       	call   18b4 <linkunlink>
  concreate();
    34d4:	e8 ed e0 ff ff       	call   15c6 <concreate>
  fourfiles();
    34d9:	e8 4e d9 ff ff       	call   e2c <fourfiles>
  sharedfd();
    34de:	e8 ac d7 ff ff       	call   c8f <sharedfd>

  bigargtest();
    34e3:	e8 a1 fb ff ff       	call   3089 <bigargtest>
  bigwrite();
    34e8:	e8 3d ed ff ff       	call   222a <bigwrite>
  bigargtest();
    34ed:	e8 97 fb ff ff       	call   3089 <bigargtest>
  bsstest();
    34f2:	e8 2f fb ff ff       	call   3026 <bsstest>
  sbrktest();
    34f7:	e8 69 f6 ff ff       	call   2b65 <sbrktest>
  validatetest();
    34fc:	e8 77 fa ff ff       	call   2f78 <validatetest>

  opentest();
    3501:	e8 a6 cd ff ff       	call   2ac <opentest>
  writetest();
    3506:	e8 34 ce ff ff       	call   33f <writetest>
  writetest1();
    350b:	e8 f7 cf ff ff       	call   507 <writetest1>
  createtest();
    3510:	e8 a2 d1 ff ff       	call   6b7 <createtest>

  openiputtest();
    3515:	e8 a9 cc ff ff       	call   1c3 <openiputtest>
  exitiputtest();
    351a:	e8 be cb ff ff       	call   dd <exitiputtest>
  iputtest();
    351f:	e8 dc ca ff ff       	call   0 <iputtest>

  mem();
    3524:	e8 ab d6 ff ff       	call   bd4 <mem>
  pipe1();
    3529:	e8 5b d3 ff ff       	call   889 <pipe1>
  preempt();
    352e:	e8 f6 d4 ff ff       	call   a29 <preempt>
  exitwait();
    3533:	e8 2c d6 ff ff       	call   b64 <exitwait>

  rmdot();
    3538:	e8 b2 f0 ff ff       	call   25ef <rmdot>
  fourteen();
    353d:	e8 70 ef ff ff       	call   24b2 <fourteen>
  bigfile();
    3542:	e8 b5 ed ff ff       	call   22fc <bigfile>
  subdir();
    3547:	e8 b0 e5 ff ff       	call   1afc <subdir>
  linktest();
    354c:	e8 4f de ff ff       	call   13a0 <linktest>
  unlinkread();
    3551:	e8 b1 dc ff ff       	call   1207 <unlinkread>
  dirfile();
    3556:	e8 19 f2 ff ff       	call   2774 <dirfile>
  iref();
    355b:	e8 2e f4 ff ff       	call   298e <iref>
  forktest();
    3560:	e8 51 f5 ff ff       	call   2ab6 <forktest>
  bigdir(); // slow
    3565:	e8 3e e4 ff ff       	call   19a8 <bigdir>

  uio();
    356a:	e8 06 fe ff ff       	call   3375 <uio>

  exectest();
    356f:	e8 cc d2 ff ff       	call   840 <exectest>

  exit();
    3574:	e8 2a 02 00 00       	call   37a3 <exit>

00003579 <strcpy>:
#include "mmu.h"
#include <stddef.h>

char*
strcpy(char *s, const char *t)
{
    3579:	55                   	push   %ebp
    357a:	89 e5                	mov    %esp,%ebp
    357c:	56                   	push   %esi
    357d:	53                   	push   %ebx
    357e:	8b 75 08             	mov    0x8(%ebp),%esi
    3581:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3584:	89 f0                	mov    %esi,%eax
    3586:	89 d1                	mov    %edx,%ecx
    3588:	83 c2 01             	add    $0x1,%edx
    358b:	89 c3                	mov    %eax,%ebx
    358d:	83 c0 01             	add    $0x1,%eax
    3590:	0f b6 09             	movzbl (%ecx),%ecx
    3593:	88 0b                	mov    %cl,(%ebx)
    3595:	84 c9                	test   %cl,%cl
    3597:	75 ed                	jne    3586 <strcpy+0xd>
    ;
  return os;
}
    3599:	89 f0                	mov    %esi,%eax
    359b:	5b                   	pop    %ebx
    359c:	5e                   	pop    %esi
    359d:	5d                   	pop    %ebp
    359e:	c3                   	ret    

0000359f <strcmp>:

int
strcmp(const char *p, const char *q)
{
    359f:	55                   	push   %ebp
    35a0:	89 e5                	mov    %esp,%ebp
    35a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    35a5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    35a8:	eb 06                	jmp    35b0 <strcmp+0x11>
    p++, q++;
    35aa:	83 c1 01             	add    $0x1,%ecx
    35ad:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    35b0:	0f b6 01             	movzbl (%ecx),%eax
    35b3:	84 c0                	test   %al,%al
    35b5:	74 04                	je     35bb <strcmp+0x1c>
    35b7:	3a 02                	cmp    (%edx),%al
    35b9:	74 ef                	je     35aa <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
    35bb:	0f b6 c0             	movzbl %al,%eax
    35be:	0f b6 12             	movzbl (%edx),%edx
    35c1:	29 d0                	sub    %edx,%eax
}
    35c3:	5d                   	pop    %ebp
    35c4:	c3                   	ret    

000035c5 <strlen>:

uint
strlen(const char *s)
{
    35c5:	55                   	push   %ebp
    35c6:	89 e5                	mov    %esp,%ebp
    35c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    35cb:	b8 00 00 00 00       	mov    $0x0,%eax
    35d0:	eb 03                	jmp    35d5 <strlen+0x10>
    35d2:	83 c0 01             	add    $0x1,%eax
    35d5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
    35d9:	75 f7                	jne    35d2 <strlen+0xd>
    ;
  return n;
}
    35db:	5d                   	pop    %ebp
    35dc:	c3                   	ret    

000035dd <memset>:

void*
memset(void *dst, int c, uint n)
{
    35dd:	55                   	push   %ebp
    35de:	89 e5                	mov    %esp,%ebp
    35e0:	57                   	push   %edi
    35e1:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    35e4:	89 d7                	mov    %edx,%edi
    35e6:	8b 4d 10             	mov    0x10(%ebp),%ecx
    35e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    35ec:	fc                   	cld    
    35ed:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    35ef:	89 d0                	mov    %edx,%eax
    35f1:	8b 7d fc             	mov    -0x4(%ebp),%edi
    35f4:	c9                   	leave  
    35f5:	c3                   	ret    

000035f6 <strchr>:

char*
strchr(const char *s, char c)
{
    35f6:	55                   	push   %ebp
    35f7:	89 e5                	mov    %esp,%ebp
    35f9:	8b 45 08             	mov    0x8(%ebp),%eax
    35fc:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    3600:	eb 03                	jmp    3605 <strchr+0xf>
    3602:	83 c0 01             	add    $0x1,%eax
    3605:	0f b6 10             	movzbl (%eax),%edx
    3608:	84 d2                	test   %dl,%dl
    360a:	74 06                	je     3612 <strchr+0x1c>
    if(*s == c)
    360c:	38 ca                	cmp    %cl,%dl
    360e:	75 f2                	jne    3602 <strchr+0xc>
    3610:	eb 05                	jmp    3617 <strchr+0x21>
      return (char*)s;
  return 0;
    3612:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3617:	5d                   	pop    %ebp
    3618:	c3                   	ret    

00003619 <gets>:

char*
gets(char *buf, int max)
{
    3619:	55                   	push   %ebp
    361a:	89 e5                	mov    %esp,%ebp
    361c:	57                   	push   %edi
    361d:	56                   	push   %esi
    361e:	53                   	push   %ebx
    361f:	83 ec 1c             	sub    $0x1c,%esp
    3622:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3625:	bb 00 00 00 00       	mov    $0x0,%ebx
    362a:	89 de                	mov    %ebx,%esi
    362c:	83 c3 01             	add    $0x1,%ebx
    362f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3632:	7d 2e                	jge    3662 <gets+0x49>
    cc = read(0, &c, 1);
    3634:	83 ec 04             	sub    $0x4,%esp
    3637:	6a 01                	push   $0x1
    3639:	8d 45 e7             	lea    -0x19(%ebp),%eax
    363c:	50                   	push   %eax
    363d:	6a 00                	push   $0x0
    363f:	e8 77 01 00 00       	call   37bb <read>
    if(cc < 1)
    3644:	83 c4 10             	add    $0x10,%esp
    3647:	85 c0                	test   %eax,%eax
    3649:	7e 17                	jle    3662 <gets+0x49>
      break;
    buf[i++] = c;
    364b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    364f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
    3652:	3c 0a                	cmp    $0xa,%al
    3654:	0f 94 c2             	sete   %dl
    3657:	3c 0d                	cmp    $0xd,%al
    3659:	0f 94 c0             	sete   %al
    365c:	08 c2                	or     %al,%dl
    365e:	74 ca                	je     362a <gets+0x11>
    buf[i++] = c;
    3660:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
    3662:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    3666:	89 f8                	mov    %edi,%eax
    3668:	8d 65 f4             	lea    -0xc(%ebp),%esp
    366b:	5b                   	pop    %ebx
    366c:	5e                   	pop    %esi
    366d:	5f                   	pop    %edi
    366e:	5d                   	pop    %ebp
    366f:	c3                   	ret    

00003670 <stat>:

int
stat(const char *n, struct stat *st)
{
    3670:	55                   	push   %ebp
    3671:	89 e5                	mov    %esp,%ebp
    3673:	56                   	push   %esi
    3674:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3675:	83 ec 08             	sub    $0x8,%esp
    3678:	6a 00                	push   $0x0
    367a:	ff 75 08             	push   0x8(%ebp)
    367d:	e8 61 01 00 00       	call   37e3 <open>
  if(fd < 0)
    3682:	83 c4 10             	add    $0x10,%esp
    3685:	85 c0                	test   %eax,%eax
    3687:	78 24                	js     36ad <stat+0x3d>
    3689:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
    368b:	83 ec 08             	sub    $0x8,%esp
    368e:	ff 75 0c             	push   0xc(%ebp)
    3691:	50                   	push   %eax
    3692:	e8 64 01 00 00       	call   37fb <fstat>
    3697:	89 c6                	mov    %eax,%esi
  close(fd);
    3699:	89 1c 24             	mov    %ebx,(%esp)
    369c:	e8 2a 01 00 00       	call   37cb <close>
  return r;
    36a1:	83 c4 10             	add    $0x10,%esp
}
    36a4:	89 f0                	mov    %esi,%eax
    36a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    36a9:	5b                   	pop    %ebx
    36aa:	5e                   	pop    %esi
    36ab:	5d                   	pop    %ebp
    36ac:	c3                   	ret    
    return -1;
    36ad:	be ff ff ff ff       	mov    $0xffffffff,%esi
    36b2:	eb f0                	jmp    36a4 <stat+0x34>

000036b4 <atoi>:

int
atoi(const char *s)
{
    36b4:	55                   	push   %ebp
    36b5:	89 e5                	mov    %esp,%ebp
    36b7:	53                   	push   %ebx
    36b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
    36bb:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
    36c0:	eb 10                	jmp    36d2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
    36c2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
    36c5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
    36c8:	83 c1 01             	add    $0x1,%ecx
    36cb:	0f be c0             	movsbl %al,%eax
    36ce:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
    36d2:	0f b6 01             	movzbl (%ecx),%eax
    36d5:	8d 58 d0             	lea    -0x30(%eax),%ebx
    36d8:	80 fb 09             	cmp    $0x9,%bl
    36db:	76 e5                	jbe    36c2 <atoi+0xe>
  return n;
}
    36dd:	89 d0                	mov    %edx,%eax
    36df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    36e2:	c9                   	leave  
    36e3:	c3                   	ret    

000036e4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    36e4:	55                   	push   %ebp
    36e5:	89 e5                	mov    %esp,%ebp
    36e7:	56                   	push   %esi
    36e8:	53                   	push   %ebx
    36e9:	8b 75 08             	mov    0x8(%ebp),%esi
    36ec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    36ef:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
    36f2:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
    36f4:	eb 0d                	jmp    3703 <memmove+0x1f>
    *dst++ = *src++;
    36f6:	0f b6 01             	movzbl (%ecx),%eax
    36f9:	88 02                	mov    %al,(%edx)
    36fb:	8d 49 01             	lea    0x1(%ecx),%ecx
    36fe:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
    3701:	89 d8                	mov    %ebx,%eax
    3703:	8d 58 ff             	lea    -0x1(%eax),%ebx
    3706:	85 c0                	test   %eax,%eax
    3708:	7f ec                	jg     36f6 <memmove+0x12>
  return vdst;
}
    370a:	89 f0                	mov    %esi,%eax
    370c:	5b                   	pop    %ebx
    370d:	5e                   	pop    %esi
    370e:	5d                   	pop    %ebp
    370f:	c3                   	ret    

00003710 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
    3710:	55                   	push   %ebp
    3711:	89 e5                	mov    %esp,%ebp
    3713:	83 ec 14             	sub    $0x14,%esp

  void* stack = malloc(2 * PGSIZE);
    3716:	68 00 20 00 00       	push   $0x2000
    371b:	e8 fe 03 00 00       	call   3b1e <malloc>
  if ((uint)stack % PGSIZE) {
    3720:	83 c4 10             	add    $0x10,%esp
    3723:	a9 ff 0f 00 00       	test   $0xfff,%eax
    3728:	74 0a                	je     3734 <thread_create+0x24>
    stack = (void*)((uint)stack + (PGSIZE - ((uint)stack % PGSIZE)));
    372a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    372f:	05 00 10 00 00       	add    $0x1000,%eax
  } 

  return clone(start_routine, arg1, arg2, stack);
    3734:	50                   	push   %eax
    3735:	ff 75 10             	push   0x10(%ebp)
    3738:	ff 75 0c             	push   0xc(%ebp)
    373b:	ff 75 08             	push   0x8(%ebp)
    373e:	e8 00 01 00 00       	call   3843 <clone>
}
    3743:	c9                   	leave  
    3744:	c3                   	ret    

00003745 <thread_join>:

int thread_join() {
    3745:	55                   	push   %ebp
    3746:	89 e5                	mov    %esp,%ebp
    3748:	53                   	push   %ebx
    3749:	83 ec 20             	sub    $0x20,%esp
  void *stack;
  int x = join(&stack);
    374c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    374f:	50                   	push   %eax
    3750:	e8 f6 00 00 00       	call   384b <join>
    3755:	89 c3                	mov    %eax,%ebx

  free(stack);
    3757:	83 c4 04             	add    $0x4,%esp
    375a:	ff 75 f4             	push   -0xc(%ebp)
    375d:	e8 fc 02 00 00       	call   3a5e <free>

  return x;
}
    3762:	89 d8                	mov    %ebx,%eax
    3764:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3767:	c9                   	leave  
    3768:	c3                   	ret    

00003769 <lock_init>:

void lock_init(lock_t *spin) {
    3769:	55                   	push   %ebp
    376a:	89 e5                	mov    %esp,%ebp
  spin->locked = 0;
    376c:	8b 45 08             	mov    0x8(%ebp),%eax
    376f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    3775:	5d                   	pop    %ebp
    3776:	c3                   	ret    

00003777 <lock_acquire>:

void lock_acquire(lock_t *spin) {
    3777:	55                   	push   %ebp
    3778:	89 e5                	mov    %esp,%ebp
    377a:	8b 55 08             	mov    0x8(%ebp),%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    377d:	b8 01 00 00 00       	mov    $0x1,%eax
    3782:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&spin->locked, 1) != 0);
    3785:	85 c0                	test   %eax,%eax
    3787:	75 f4                	jne    377d <lock_acquire+0x6>
}
    3789:	5d                   	pop    %ebp
    378a:	c3                   	ret    

0000378b <lock_release>:

void lock_release(lock_t *spin) {
    378b:	55                   	push   %ebp
    378c:	89 e5                	mov    %esp,%ebp
    378e:	8b 55 08             	mov    0x8(%ebp),%edx
    3791:	b8 00 00 00 00       	mov    $0x0,%eax
    3796:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&spin->locked, 0);
    3799:	5d                   	pop    %ebp
    379a:	c3                   	ret    

0000379b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    379b:	b8 01 00 00 00       	mov    $0x1,%eax
    37a0:	cd 40                	int    $0x40
    37a2:	c3                   	ret    

000037a3 <exit>:
SYSCALL(exit)
    37a3:	b8 02 00 00 00       	mov    $0x2,%eax
    37a8:	cd 40                	int    $0x40
    37aa:	c3                   	ret    

000037ab <wait>:
SYSCALL(wait)
    37ab:	b8 03 00 00 00       	mov    $0x3,%eax
    37b0:	cd 40                	int    $0x40
    37b2:	c3                   	ret    

000037b3 <pipe>:
SYSCALL(pipe)
    37b3:	b8 04 00 00 00       	mov    $0x4,%eax
    37b8:	cd 40                	int    $0x40
    37ba:	c3                   	ret    

000037bb <read>:
SYSCALL(read)
    37bb:	b8 05 00 00 00       	mov    $0x5,%eax
    37c0:	cd 40                	int    $0x40
    37c2:	c3                   	ret    

000037c3 <write>:
SYSCALL(write)
    37c3:	b8 10 00 00 00       	mov    $0x10,%eax
    37c8:	cd 40                	int    $0x40
    37ca:	c3                   	ret    

000037cb <close>:
SYSCALL(close)
    37cb:	b8 15 00 00 00       	mov    $0x15,%eax
    37d0:	cd 40                	int    $0x40
    37d2:	c3                   	ret    

000037d3 <kill>:
SYSCALL(kill)
    37d3:	b8 06 00 00 00       	mov    $0x6,%eax
    37d8:	cd 40                	int    $0x40
    37da:	c3                   	ret    

000037db <exec>:
SYSCALL(exec)
    37db:	b8 07 00 00 00       	mov    $0x7,%eax
    37e0:	cd 40                	int    $0x40
    37e2:	c3                   	ret    

000037e3 <open>:
SYSCALL(open)
    37e3:	b8 0f 00 00 00       	mov    $0xf,%eax
    37e8:	cd 40                	int    $0x40
    37ea:	c3                   	ret    

000037eb <mknod>:
SYSCALL(mknod)
    37eb:	b8 11 00 00 00       	mov    $0x11,%eax
    37f0:	cd 40                	int    $0x40
    37f2:	c3                   	ret    

000037f3 <unlink>:
SYSCALL(unlink)
    37f3:	b8 12 00 00 00       	mov    $0x12,%eax
    37f8:	cd 40                	int    $0x40
    37fa:	c3                   	ret    

000037fb <fstat>:
SYSCALL(fstat)
    37fb:	b8 08 00 00 00       	mov    $0x8,%eax
    3800:	cd 40                	int    $0x40
    3802:	c3                   	ret    

00003803 <link>:
SYSCALL(link)
    3803:	b8 13 00 00 00       	mov    $0x13,%eax
    3808:	cd 40                	int    $0x40
    380a:	c3                   	ret    

0000380b <mkdir>:
SYSCALL(mkdir)
    380b:	b8 14 00 00 00       	mov    $0x14,%eax
    3810:	cd 40                	int    $0x40
    3812:	c3                   	ret    

00003813 <chdir>:
SYSCALL(chdir)
    3813:	b8 09 00 00 00       	mov    $0x9,%eax
    3818:	cd 40                	int    $0x40
    381a:	c3                   	ret    

0000381b <dup>:
SYSCALL(dup)
    381b:	b8 0a 00 00 00       	mov    $0xa,%eax
    3820:	cd 40                	int    $0x40
    3822:	c3                   	ret    

00003823 <getpid>:
SYSCALL(getpid)
    3823:	b8 0b 00 00 00       	mov    $0xb,%eax
    3828:	cd 40                	int    $0x40
    382a:	c3                   	ret    

0000382b <sbrk>:
SYSCALL(sbrk)
    382b:	b8 0c 00 00 00       	mov    $0xc,%eax
    3830:	cd 40                	int    $0x40
    3832:	c3                   	ret    

00003833 <sleep>:
SYSCALL(sleep)
    3833:	b8 0d 00 00 00       	mov    $0xd,%eax
    3838:	cd 40                	int    $0x40
    383a:	c3                   	ret    

0000383b <uptime>:
SYSCALL(uptime)
    383b:	b8 0e 00 00 00       	mov    $0xe,%eax
    3840:	cd 40                	int    $0x40
    3842:	c3                   	ret    

00003843 <clone>:
SYSCALL(clone)
    3843:	b8 16 00 00 00       	mov    $0x16,%eax
    3848:	cd 40                	int    $0x40
    384a:	c3                   	ret    

0000384b <join>:
    384b:	b8 17 00 00 00       	mov    $0x17,%eax
    3850:	cd 40                	int    $0x40
    3852:	c3                   	ret    

00003853 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3853:	55                   	push   %ebp
    3854:	89 e5                	mov    %esp,%ebp
    3856:	83 ec 1c             	sub    $0x1c,%esp
    3859:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    385c:	6a 01                	push   $0x1
    385e:	8d 55 f4             	lea    -0xc(%ebp),%edx
    3861:	52                   	push   %edx
    3862:	50                   	push   %eax
    3863:	e8 5b ff ff ff       	call   37c3 <write>
}
    3868:	83 c4 10             	add    $0x10,%esp
    386b:	c9                   	leave  
    386c:	c3                   	ret    

0000386d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    386d:	55                   	push   %ebp
    386e:	89 e5                	mov    %esp,%ebp
    3870:	57                   	push   %edi
    3871:	56                   	push   %esi
    3872:	53                   	push   %ebx
    3873:	83 ec 2c             	sub    $0x2c,%esp
    3876:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3879:	89 d0                	mov    %edx,%eax
    387b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    387d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3881:	0f 95 c1             	setne  %cl
    3884:	c1 ea 1f             	shr    $0x1f,%edx
    3887:	84 d1                	test   %dl,%cl
    3889:	74 44                	je     38cf <printint+0x62>
    neg = 1;
    x = -xx;
    388b:	f7 d8                	neg    %eax
    388d:	89 c1                	mov    %eax,%ecx
    neg = 1;
    388f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3896:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
    389b:	89 c8                	mov    %ecx,%eax
    389d:	ba 00 00 00 00       	mov    $0x0,%edx
    38a2:	f7 f6                	div    %esi
    38a4:	89 df                	mov    %ebx,%edi
    38a6:	83 c3 01             	add    $0x1,%ebx
    38a9:	0f b6 92 a0 53 00 00 	movzbl 0x53a0(%edx),%edx
    38b0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
    38b4:	89 ca                	mov    %ecx,%edx
    38b6:	89 c1                	mov    %eax,%ecx
    38b8:	39 d6                	cmp    %edx,%esi
    38ba:	76 df                	jbe    389b <printint+0x2e>
  if(neg)
    38bc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    38c0:	74 31                	je     38f3 <printint+0x86>
    buf[i++] = '-';
    38c2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    38c7:	8d 5f 02             	lea    0x2(%edi),%ebx
    38ca:	8b 75 d0             	mov    -0x30(%ebp),%esi
    38cd:	eb 17                	jmp    38e6 <printint+0x79>
    x = xx;
    38cf:	89 c1                	mov    %eax,%ecx
  neg = 0;
    38d1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    38d8:	eb bc                	jmp    3896 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
    38da:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    38df:	89 f0                	mov    %esi,%eax
    38e1:	e8 6d ff ff ff       	call   3853 <putc>
  while(--i >= 0)
    38e6:	83 eb 01             	sub    $0x1,%ebx
    38e9:	79 ef                	jns    38da <printint+0x6d>
}
    38eb:	83 c4 2c             	add    $0x2c,%esp
    38ee:	5b                   	pop    %ebx
    38ef:	5e                   	pop    %esi
    38f0:	5f                   	pop    %edi
    38f1:	5d                   	pop    %ebp
    38f2:	c3                   	ret    
    38f3:	8b 75 d0             	mov    -0x30(%ebp),%esi
    38f6:	eb ee                	jmp    38e6 <printint+0x79>

000038f8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    38f8:	55                   	push   %ebp
    38f9:	89 e5                	mov    %esp,%ebp
    38fb:	57                   	push   %edi
    38fc:	56                   	push   %esi
    38fd:	53                   	push   %ebx
    38fe:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    3901:	8d 45 10             	lea    0x10(%ebp),%eax
    3904:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
    3907:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
    390c:	bb 00 00 00 00       	mov    $0x0,%ebx
    3911:	eb 14                	jmp    3927 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    3913:	89 fa                	mov    %edi,%edx
    3915:	8b 45 08             	mov    0x8(%ebp),%eax
    3918:	e8 36 ff ff ff       	call   3853 <putc>
    391d:	eb 05                	jmp    3924 <printf+0x2c>
      }
    } else if(state == '%'){
    391f:	83 fe 25             	cmp    $0x25,%esi
    3922:	74 25                	je     3949 <printf+0x51>
  for(i = 0; fmt[i]; i++){
    3924:	83 c3 01             	add    $0x1,%ebx
    3927:	8b 45 0c             	mov    0xc(%ebp),%eax
    392a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
    392e:	84 c0                	test   %al,%al
    3930:	0f 84 20 01 00 00    	je     3a56 <printf+0x15e>
    c = fmt[i] & 0xff;
    3936:	0f be f8             	movsbl %al,%edi
    3939:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
    393c:	85 f6                	test   %esi,%esi
    393e:	75 df                	jne    391f <printf+0x27>
      if(c == '%'){
    3940:	83 f8 25             	cmp    $0x25,%eax
    3943:	75 ce                	jne    3913 <printf+0x1b>
        state = '%';
    3945:	89 c6                	mov    %eax,%esi
    3947:	eb db                	jmp    3924 <printf+0x2c>
      if(c == 'd'){
    3949:	83 f8 25             	cmp    $0x25,%eax
    394c:	0f 84 cf 00 00 00    	je     3a21 <printf+0x129>
    3952:	0f 8c dd 00 00 00    	jl     3a35 <printf+0x13d>
    3958:	83 f8 78             	cmp    $0x78,%eax
    395b:	0f 8f d4 00 00 00    	jg     3a35 <printf+0x13d>
    3961:	83 f8 63             	cmp    $0x63,%eax
    3964:	0f 8c cb 00 00 00    	jl     3a35 <printf+0x13d>
    396a:	83 e8 63             	sub    $0x63,%eax
    396d:	83 f8 15             	cmp    $0x15,%eax
    3970:	0f 87 bf 00 00 00    	ja     3a35 <printf+0x13d>
    3976:	ff 24 85 48 53 00 00 	jmp    *0x5348(,%eax,4)
        printint(fd, *ap, 10, 1);
    397d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3980:	8b 17                	mov    (%edi),%edx
    3982:	83 ec 0c             	sub    $0xc,%esp
    3985:	6a 01                	push   $0x1
    3987:	b9 0a 00 00 00       	mov    $0xa,%ecx
    398c:	8b 45 08             	mov    0x8(%ebp),%eax
    398f:	e8 d9 fe ff ff       	call   386d <printint>
        ap++;
    3994:	83 c7 04             	add    $0x4,%edi
    3997:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    399a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    399d:	be 00 00 00 00       	mov    $0x0,%esi
    39a2:	eb 80                	jmp    3924 <printf+0x2c>
        printint(fd, *ap, 16, 0);
    39a4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    39a7:	8b 17                	mov    (%edi),%edx
    39a9:	83 ec 0c             	sub    $0xc,%esp
    39ac:	6a 00                	push   $0x0
    39ae:	b9 10 00 00 00       	mov    $0x10,%ecx
    39b3:	8b 45 08             	mov    0x8(%ebp),%eax
    39b6:	e8 b2 fe ff ff       	call   386d <printint>
        ap++;
    39bb:	83 c7 04             	add    $0x4,%edi
    39be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    39c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
    39c4:	be 00 00 00 00       	mov    $0x0,%esi
    39c9:	e9 56 ff ff ff       	jmp    3924 <printf+0x2c>
        s = (char*)*ap;
    39ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    39d1:	8b 30                	mov    (%eax),%esi
        ap++;
    39d3:	83 c0 04             	add    $0x4,%eax
    39d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
    39d9:	85 f6                	test   %esi,%esi
    39db:	75 15                	jne    39f2 <printf+0xfa>
          s = "(null)";
    39dd:	be 3e 53 00 00       	mov    $0x533e,%esi
    39e2:	eb 0e                	jmp    39f2 <printf+0xfa>
          putc(fd, *s);
    39e4:	0f be d2             	movsbl %dl,%edx
    39e7:	8b 45 08             	mov    0x8(%ebp),%eax
    39ea:	e8 64 fe ff ff       	call   3853 <putc>
          s++;
    39ef:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
    39f2:	0f b6 16             	movzbl (%esi),%edx
    39f5:	84 d2                	test   %dl,%dl
    39f7:	75 eb                	jne    39e4 <printf+0xec>
      state = 0;
    39f9:	be 00 00 00 00       	mov    $0x0,%esi
    39fe:	e9 21 ff ff ff       	jmp    3924 <printf+0x2c>
        putc(fd, *ap);
    3a03:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    3a06:	0f be 17             	movsbl (%edi),%edx
    3a09:	8b 45 08             	mov    0x8(%ebp),%eax
    3a0c:	e8 42 fe ff ff       	call   3853 <putc>
        ap++;
    3a11:	83 c7 04             	add    $0x4,%edi
    3a14:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
    3a17:	be 00 00 00 00       	mov    $0x0,%esi
    3a1c:	e9 03 ff ff ff       	jmp    3924 <printf+0x2c>
        putc(fd, c);
    3a21:	89 fa                	mov    %edi,%edx
    3a23:	8b 45 08             	mov    0x8(%ebp),%eax
    3a26:	e8 28 fe ff ff       	call   3853 <putc>
      state = 0;
    3a2b:	be 00 00 00 00       	mov    $0x0,%esi
    3a30:	e9 ef fe ff ff       	jmp    3924 <printf+0x2c>
        putc(fd, '%');
    3a35:	ba 25 00 00 00       	mov    $0x25,%edx
    3a3a:	8b 45 08             	mov    0x8(%ebp),%eax
    3a3d:	e8 11 fe ff ff       	call   3853 <putc>
        putc(fd, c);
    3a42:	89 fa                	mov    %edi,%edx
    3a44:	8b 45 08             	mov    0x8(%ebp),%eax
    3a47:	e8 07 fe ff ff       	call   3853 <putc>
      state = 0;
    3a4c:	be 00 00 00 00       	mov    $0x0,%esi
    3a51:	e9 ce fe ff ff       	jmp    3924 <printf+0x2c>
    }
  }
}
    3a56:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a59:	5b                   	pop    %ebx
    3a5a:	5e                   	pop    %esi
    3a5b:	5f                   	pop    %edi
    3a5c:	5d                   	pop    %ebp
    3a5d:	c3                   	ret    

00003a5e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3a5e:	55                   	push   %ebp
    3a5f:	89 e5                	mov    %esp,%ebp
    3a61:	57                   	push   %edi
    3a62:	56                   	push   %esi
    3a63:	53                   	push   %ebx
    3a64:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3a67:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3a6a:	a1 a0 a4 00 00       	mov    0xa4a0,%eax
    3a6f:	eb 02                	jmp    3a73 <free+0x15>
    3a71:	89 d0                	mov    %edx,%eax
    3a73:	39 c8                	cmp    %ecx,%eax
    3a75:	73 04                	jae    3a7b <free+0x1d>
    3a77:	39 08                	cmp    %ecx,(%eax)
    3a79:	77 12                	ja     3a8d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3a7b:	8b 10                	mov    (%eax),%edx
    3a7d:	39 c2                	cmp    %eax,%edx
    3a7f:	77 f0                	ja     3a71 <free+0x13>
    3a81:	39 c8                	cmp    %ecx,%eax
    3a83:	72 08                	jb     3a8d <free+0x2f>
    3a85:	39 ca                	cmp    %ecx,%edx
    3a87:	77 04                	ja     3a8d <free+0x2f>
    3a89:	89 d0                	mov    %edx,%eax
    3a8b:	eb e6                	jmp    3a73 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3a8d:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3a90:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3a93:	8b 10                	mov    (%eax),%edx
    3a95:	39 d7                	cmp    %edx,%edi
    3a97:	74 19                	je     3ab2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3a99:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3a9c:	8b 50 04             	mov    0x4(%eax),%edx
    3a9f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3aa2:	39 ce                	cmp    %ecx,%esi
    3aa4:	74 1b                	je     3ac1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3aa6:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3aa8:	a3 a0 a4 00 00       	mov    %eax,0xa4a0
}
    3aad:	5b                   	pop    %ebx
    3aae:	5e                   	pop    %esi
    3aaf:	5f                   	pop    %edi
    3ab0:	5d                   	pop    %ebp
    3ab1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    3ab2:	03 72 04             	add    0x4(%edx),%esi
    3ab5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3ab8:	8b 10                	mov    (%eax),%edx
    3aba:	8b 12                	mov    (%edx),%edx
    3abc:	89 53 f8             	mov    %edx,-0x8(%ebx)
    3abf:	eb db                	jmp    3a9c <free+0x3e>
    p->s.size += bp->s.size;
    3ac1:	03 53 fc             	add    -0x4(%ebx),%edx
    3ac4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3ac7:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3aca:	89 10                	mov    %edx,(%eax)
    3acc:	eb da                	jmp    3aa8 <free+0x4a>

00003ace <morecore>:

static Header*
morecore(uint nu)
{
    3ace:	55                   	push   %ebp
    3acf:	89 e5                	mov    %esp,%ebp
    3ad1:	53                   	push   %ebx
    3ad2:	83 ec 04             	sub    $0x4,%esp
    3ad5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    3ad7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    3adc:	77 05                	ja     3ae3 <morecore+0x15>
    nu = 4096;
    3ade:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    3ae3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    3aea:	83 ec 0c             	sub    $0xc,%esp
    3aed:	50                   	push   %eax
    3aee:	e8 38 fd ff ff       	call   382b <sbrk>
  if(p == (char*)-1)
    3af3:	83 c4 10             	add    $0x10,%esp
    3af6:	83 f8 ff             	cmp    $0xffffffff,%eax
    3af9:	74 1c                	je     3b17 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3afb:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3afe:	83 c0 08             	add    $0x8,%eax
    3b01:	83 ec 0c             	sub    $0xc,%esp
    3b04:	50                   	push   %eax
    3b05:	e8 54 ff ff ff       	call   3a5e <free>
  return freep;
    3b0a:	a1 a0 a4 00 00       	mov    0xa4a0,%eax
    3b0f:	83 c4 10             	add    $0x10,%esp
}
    3b12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b15:	c9                   	leave  
    3b16:	c3                   	ret    
    return 0;
    3b17:	b8 00 00 00 00       	mov    $0x0,%eax
    3b1c:	eb f4                	jmp    3b12 <morecore+0x44>

00003b1e <malloc>:

void*
malloc(uint nbytes)
{
    3b1e:	55                   	push   %ebp
    3b1f:	89 e5                	mov    %esp,%ebp
    3b21:	53                   	push   %ebx
    3b22:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3b25:	8b 45 08             	mov    0x8(%ebp),%eax
    3b28:	8d 58 07             	lea    0x7(%eax),%ebx
    3b2b:	c1 eb 03             	shr    $0x3,%ebx
    3b2e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    3b31:	8b 0d a0 a4 00 00    	mov    0xa4a0,%ecx
    3b37:	85 c9                	test   %ecx,%ecx
    3b39:	74 04                	je     3b3f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3b3b:	8b 01                	mov    (%ecx),%eax
    3b3d:	eb 4a                	jmp    3b89 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
    3b3f:	c7 05 a0 a4 00 00 a4 	movl   $0xa4a4,0xa4a0
    3b46:	a4 00 00 
    3b49:	c7 05 a4 a4 00 00 a4 	movl   $0xa4a4,0xa4a4
    3b50:	a4 00 00 
    base.s.size = 0;
    3b53:	c7 05 a8 a4 00 00 00 	movl   $0x0,0xa4a8
    3b5a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    3b5d:	b9 a4 a4 00 00       	mov    $0xa4a4,%ecx
    3b62:	eb d7                	jmp    3b3b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3b64:	74 19                	je     3b7f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3b66:	29 da                	sub    %ebx,%edx
    3b68:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    3b6b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    3b6e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    3b71:	89 0d a0 a4 00 00    	mov    %ecx,0xa4a0
      return (void*)(p + 1);
    3b77:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3b7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b7d:	c9                   	leave  
    3b7e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    3b7f:	8b 10                	mov    (%eax),%edx
    3b81:	89 11                	mov    %edx,(%ecx)
    3b83:	eb ec                	jmp    3b71 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3b85:	89 c1                	mov    %eax,%ecx
    3b87:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    3b89:	8b 50 04             	mov    0x4(%eax),%edx
    3b8c:	39 da                	cmp    %ebx,%edx
    3b8e:	73 d4                	jae    3b64 <malloc+0x46>
    if(p == freep)
    3b90:	39 05 a0 a4 00 00    	cmp    %eax,0xa4a0
    3b96:	75 ed                	jne    3b85 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
    3b98:	89 d8                	mov    %ebx,%eax
    3b9a:	e8 2f ff ff ff       	call   3ace <morecore>
    3b9f:	85 c0                	test   %eax,%eax
    3ba1:	75 e2                	jne    3b85 <malloc+0x67>
    3ba3:	eb d5                	jmp    3b7a <malloc+0x5c>
