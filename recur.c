typedef struct
{
    char c;
    int value;
    bool leading;
}CharItem;

typedef struct
{
    bool used;
    int value;
}CharValue;


/*
CharItem char_item[max_char_count] =
    {
      { 'W', -1, true  }, { 'D', -1, true  }, { 'O', -1, false },
      { 'T', -1, false }, { 'G', -1, true  }, { 'L', -1, false },
      { 'E', -1, false }, { 'C', -1, false }, { 'M', -1, false }
    };

CharValue char_val[max_number_count] =
    {
      {false, 0}, {false, 1}, {false, 2}, {false, 3},
      {false, 4}, {false, 5}, {false, 6}, {false, 7},
      {false, 8}, {false, 9}
    };
 */   

void SearchingResult(CharItem ci[max_char_count],
                     CharValue cv[max_number_count],
                     int index, CharListReadyFuncPtr callback)
{
    if(index == max_char_count)
    {
        callback(ci);
        return;
    }

    for(int i = 0; i < max_number_count; ++i)
    {
        if(IsValueValid(ci[index], cv[i]))
        {
            cv[i].used = true;/*set used sign*/
            ci[index].value = cv[i].value;
            SearchingResult(ci, cv, index + 1, callback);
            cv[i].used = false;/*clear used sign*/
        }
    }
}
     
void OnCharListReady(CharItem ci[max_char_count])
{
    char *minuend    = "WWWDOT";
    char *subtrahend = "GOOGLE";
    char *diff       = "DOTCOM";

    int m = MakeIntegerValue(ci, minuend);
    int s = MakeIntegerValue(ci, subtrahend);
    int d = MakeIntegerValue(ci, diff);
    if((m - s) == d)
    {
        std::cout << m << " - " << s << " = " << d << std::endl;
    }
}     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     