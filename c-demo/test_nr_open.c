#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number_of_sockets>\n", argv[0]);
        exit(2);
    }

    int n = atoi(argv[1]);
    if (n <= 0) {
        fprintf(stderr, "The number of sockets must be a positive integer.\n");
        exit(3);
    }

    int *sockets = malloc(n * sizeof(int));
    if (sockets == NULL) {
        perror("Failed to allocate memory for sockets");
        exit(4);
    }

    for (int i = 0; i < n; i++) {
        sockets[i] = socket(AF_INET, SOCK_STREAM, 0);
        if (sockets[i] == -1) {
            perror("Failed to create socket");
            free(sockets);
            exit(5);
        }
    }

    printf("Created %d sockets. Keeping the process running...\n", n);

    // 保持进程不退出
    while (1) {
        sleep(1);
    }
}
