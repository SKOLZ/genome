#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Given a DNA codon split into the 3 char parameters, returns the matching Amino acid*/
char codonToSlc(char, char, char, int);

int main(void) {
	printf("%s", "Poneme el ADN viteh...\nADN: ");
	char adn[9999];
	scanf("%s", adn);

	if (adn[0] == 'A' && adn[1] == 'U' && adn[2] == 'G') {
		int i, j = 0;
		int adnlen = strlen(adn) - 3;
		int iterations = adnlen / 3;
		if (adnlen % 3 != 0) {
			printf("Invalid ADN sequence - Length error");
			return 1;
		}

		for (i = 0; i < iterations; i++) {
			char first = adn[j + 3];
			//printf("Analizing: %c\n", adn[j + 3]);
			char second = adn[j + 4];
			//printf("Analizing: %c\n", adn[j + 4]);
			char third = adn[j + 5];
			//printf("Analizing: %c\n", adn[j + 5]);
			char slc = codonToSlc(first, second, third, iterations);
			if (slc == '0') {
				printf("Invalid ADN sequence - Codon error: %c", slc);
				return 1;
			} else {
				if (slc == '1') {
					printf("STOP\n");
				} else {
					if (slc == '2') {
						printf("");
					} else {
						printf("%c", slc);
					}
				}
			}
			j += 3;
		}
	} else {
		printf("ADN sequence does not start with AUG");
		return 1;
	}
	return 0;
}

char codonToSlc(char first, char second, char third, int iterations) {
	switch (first) {
	case 'A':
		switch (second) {
		case 'A':
			switch (third) {
			case 'A':
			case 'G':
				return 'K';
			case 'C':
			case 'T':
				return 'N';
			default:
				return '0';
			}
			break;
		case 'C':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
			case 'G':
				return 'T';
			default:
				return '0';
			}
			break;
		case 'T':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
				return 'I';
			case 'G':
				return 'M';
			default:
				return '0';
			}
			break;
		case 'G':
			switch (third) {
			case 'A':
			case 'G':
				return 'R';
			case 'C':
			case 'T':
				return 'S';
			default:
				return '0';
			}
			break;
		}
		break;
	case 'C':
		switch (second) {
		case 'A':
			switch (third) {
			case 'A':
			case 'G':
				return 'Q';
			case 'C':
			case 'T':
				return 'H';
			default:
				return '0';
			}
			break;
		case 'C':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
			case 'G':
				return 'P';
			default:
				return '0';
			}
			break;
		case 'T':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
			case 'G':
				return 'L';
			default:
				return '0';
			}
			break;
		case 'G':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
			case 'G':
				return 'R';
			default:
				return '0';
			}
			break;
		}
		break;
	case 'T':
		switch (second) {
		case 'A':
			switch (third) {
			case 'A':
			case 'G':
				return '1';
			case 'C':
			case 'T':
				return 'Y';
			default:
				return '0';
			}
			break;
		case 'C':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
			case 'G':
				return 'S';
			default:
				return '0';
			}
			break;
		case 'T':
			switch (third) {
			case 'A':
			case 'G':
				return 'L';
			case 'C':
			case 'T':
				return 'F';
			default:
				return '0';
			}
			break;
		case 'G':
			switch (third) {
			case 'A':
				return '1';
			case 'C':
			case 'T':
				return 'C';
			case 'G':
				return 'W';
			default:
				return '0';
			}
			break;
		}
		break;
	case 'G':
		switch (second) {
		case 'A':
			switch (third) {
			case 'A':
			case 'G':
				return 'E';
			case 'C':
			case 'T':
				return 'D';
			default:
				return '0';
			}
			break;
		case 'C':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
			case 'G':
				return 'A';
			default:
				return '0';
			}
			break;
		case 'T':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
			case 'G':
				return 'V';
			default:
				return '0';
			}
			break;
		case 'G':
			switch (third) {
			case 'A':
			case 'C':
			case 'T':
			case 'G':
				return 'G';
			default:
				return '0';
			}
			break;
		}
		break;
	case '{':
	case '[':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':
	case '0':
		iterations--;
		return '2';
		break;
	}
	return '0';
}
