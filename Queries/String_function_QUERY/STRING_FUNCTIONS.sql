/**
  LENGTH to get length for string
 */
SELECT LENGTH('sky');

/**
  UPPER for upper case
 */
SELECT UPPER('sky');

/**
  LOWER for lower case
 */
SELECT LOWER('Sky');

/**
  LTRIM to trim left unnecessary space
 */
SELECT LTRIM('       sky');

/**
  RTRIM to trim Right unnecessary space
 */
SELECT RTRIM('sky            ');

/**
  TRIM to trim Right unnecessary space
 */
SELECT TRIM('sky            ');

/**
  LEFT to get first __ characters from left
 */
SELECT LEFT('skysafada', 4);

/**
  RIGHT to get first __ characters from right
 */
SELECT RIGHT('skysafada', 4);

/**
  SUBSTRING to get characters from ___ to ___
  take string, start_pos, (end_pos) option
 */
SELECT SUBSTR('skysafada', 3, 5);
SELECT SUBSTR('skysafada', 3);

/**
  LOCATE return the
  index of first searched substring
 */
SELECT LOCATE('s','skysafada');

/**
  REPLACE return new str
  take (str, substr, new_substr)
 */
SELECT REPLACE('skysafada', 'fad','sad');

/**
  CONCAT
*/
SELECT CONCAT('skysafada','gg');


