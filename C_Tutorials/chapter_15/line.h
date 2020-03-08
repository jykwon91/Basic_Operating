#ifndef LINE_H
#define LINE_H

/**********************************************************
 * clear_line:	Clears thhe current line.		*
 *
 **********************************************************/
void clear_line(void);

/**********************************************************
 * add_word:	Adds word to the end of the current line.
 * 		if this is not the first word on the line, 
 * 		puts one space before word.
 **********************************************************/
void add_word(const char *word);
/**********************************************************
 * space_remaining:	Returns the number of characters left	*
 * 			in the cucrent line			*
 **********************************************************/
int space_remaining(void);
/**********************************************************
 * write_line:	Write the current line with		*
 * 		justification				*
 **********************************************************/
void write_line(void);
/**********************************************************
 * flush_line:	Writes the current line without		  *
 * 		justification. if the line is empty, does *
 * 		nothin.					  *
 **********************************************************/
void flush_line(void);

#endif
