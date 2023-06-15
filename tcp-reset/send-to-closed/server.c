#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <errno.h>
#include <malloc.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/ioctl.h>
#include <stdarg.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <signal.h>
#define MAXLINE 4096

int main()
{
    int listenfd,acceptfd,n;
    char recvbuf[1]={0};
    struct sockaddr_in cliaddr,servaddr;

    listenfd=socket(AF_INET,SOCK_STREAM,0);
    servaddr.sin_family=AF_INET;
    servaddr.sin_port=htons(8888);
    servaddr.sin_addr.s_addr = INADDR_ANY;

    bind(listenfd,(struct sockaddr *)&servaddr,sizeof(struct sockaddr_in));
    listen(listenfd,5);

    socklen_t clilen=sizeof(cliaddr);
    acceptfd=accept(listenfd,(struct sockaddr *)&cliaddr,&clilen);

    close(acceptfd);
    getchar();

    close(listenfd);
    return 0;
}
