#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main()
{
    struct sockaddr_in addr;
    struct timeval timeo = {0, 0};
    timeo.tv_usec = 100000;

    int fd = socket(AF_INET, SOCK_STREAM, 0);
    setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &timeo, sizeof(timeo));
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr("34.132.111.119");
    addr.sin_port = htons(atoi("22"));

    if (connect(fd, (struct sockaddr*)&addr, sizeof(addr)) == -1) {
        if (errno == EINPROGRESS) {
            fprintf(stderr, "timeout\n");
            close(fd);
        }
    }
    getchar();
    return 0;
}