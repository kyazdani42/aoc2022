#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>

char *read_file(const char *fname)
{
	int file = 0;
	struct stat *file_stats;
	char *buf = NULL;

	file = open(fname, O_RDONLY);
	if (file == -1)
	{
		return NULL;
	}

	file_stats = malloc(sizeof(struct stat));
	if (fstat(file, file_stats) == -1)
	{
		return NULL;
	}


	buf = malloc(file_stats->st_size);
	read(file, buf, file_stats->st_size);
	free(file_stats);
	return buf;
}

uint64_t sum_until_nl(char **ptr)
{
	uint64_t sum;
	char *prev;
	char *tmp;
	char buf[20];

	sum = 0;
	tmp = *ptr;
	while (tmp != NULL && *tmp != '\0' && *tmp != '\n')
	{
			bzero(buf, 20);
			prev = tmp;
			tmp = strchr(tmp, '\n');
			if (tmp == NULL)
			{
				strncpy(buf, prev, strlen(prev));
			}
			else
			{
				strncpy(buf, prev, (size_t)tmp - (size_t)prev);
				tmp++;
			}
			sum += atoll(buf);
	}

	*ptr = tmp;
	return sum;
}

void print_calories_list(char *input)
{
	char *ptr;

	ptr = input;
	while (ptr != NULL && *ptr != '\0')
	{
			printf("%ld\n", sum_until_nl(&ptr));
			ptr++;
	}
}

int main()
{
	char *input;

	input = read_file("./input");
	if (input == NULL)
	{
		return 1;
	}

	print_calories_list(input);

	free(input);
	return 0;
}
