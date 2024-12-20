function load_colors()
{
 C0="\0033[38;5;242m" #Grid  Color
 C1="\0033[31m" # Red
 C2="\0033[32m" # Green
 C3="\0033[33m" # Yellow
 C4="\0033[34m" # Blue
 C5="\0033[35m" # Magenta
 C6="\0033[36m" # Cyan
 C7="\0033[37m" # White
 C8="\0033[48;5;242m" # Cursor Background Color
}

function load_config()
{
 [[ -z "$CONFIG_FILE" ]]||source "$CONFIG_FILE"
 #DEFAULT VALUES in case config not load
 [[ -z $PREFERRED_EDITOR ]]&&PREFERRED_EDITOR=${EDITOR-nano}
 [[ -z $COLORS ]]&&COLORS=7
 [[ -z $WIDTH ]]&&WIDTH=8
 [[ -z $HEIGHT ]]&&HEIGHT=8
 [[ -z $THEME ]]&&THEME=faces
 [[ -z $RESHUFFLE ]]&&RESHUFFLE=3
 [[ -z $NAVIGATION_KEYS ]]&&NAVIGATION_KEYS="vim"
if [[ $COLORS -lt 3 ]]||[[ $COLORS -gt 7 ]];then COLORS=7;fi # protect
 if [[ $WIDTH -lt 5 ]]||[[ $WIDTH -gt 15 ]];then WIDTH=8;fi # protect
 if [[ $HEIGHT -lt 5 ]]||[[ $HEIGHT -gt 15 ]];then HEIGHT=8;fi # protect
 if [[ $NAVIGATION_KEYS == 'vim' ]];then NAV_LEFT='h';NAV_DOWN='j';NAV_UP='k';NAV_RIGHT='l';fi
 if [[ $NAVIGATION_KEYS == 'aswd' ]];then NAV_LEFT='a';NAV_DOWN='s';NAV_UP='w';NAV_RIGHT='d';fi
 case $THEME in
  faces)GLYPH=("▗▄▄▄▄▖▐▄██▄▌▐┼┼┼┼▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▄██▄▌▐▚▇▇▞▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▄██▄▌▐▞▀▀▚▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▄██▄▌▐█▜██▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▇██▄▌▐────▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▇██▇▌▐█  █▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▄██▄▌▐▖▂▝▗▌▝▀▀▀▀▘") #faces
  ;;
  numbers)GLYPH=(" ▄▄▄▄ ▐▌  ▐▌▐▌  ▐▌ ▀▀▀▀ " "  ▄▖    ▐▌    ▐▌    ▀▀  " " ▄▄▄▄▖ ▄▄▄▟▌ █     ▀▀▀▀▘" "▗▄▄▄▄▖ ▄▄▄▟▌    ▐▌▝▀▀▀▀▘" "▗▖    ▐▌  ▐▌▝▀▀▀▜▌    ▝▘" "▗▄▄▄▄ ▐▙▄▄▄     ▐▌▝▀▀▀▀ " "▗▄▄▄▄▖▐▙▄▄▄▖▐▌  ▐▌▝▀▀▀▀▘") # numbers
  ;;
  letters)GLYPH=(" ▄▄▄▄ ▐▌  ▐▌▐▛▀▀▜▌▝▘  ▝▘" "▗▄▄▄▄ ▐▙▄▄▟▌▐▌  ▐▌▝▀▀▀▀ " " ▄▄▄▄▖▐▌    ▐▌     ▀▀▀▀▘" "▗▄▄▄▄ ▐▌  ▐▌▐▌  ▐▌▝▀▀▀▀ " "▗▄▄▄▄ ▐▙▄▄  ▐▌    ▝▀▀▀▀ " "▗▄▄▄▄ ▐▙▄▄  ▐▌    ▝▘    " " ▄▄▄▄▖▐▌ ▄▄▖▐▌  ▐▌ ▀▀▀▀▘") # letters
  ;;
  greek)GLYPH=(" ▄▄▄▄ ▐▌▁▁▐▌▐▌▔▔▐▌ ▀▀▀▀ " "▗▄▄▄▄▖█ ▐▌ █▝▀▜▛▀▘  ▝▘  " " ▄▄▄▄▖ █     █     ▀    " "  ▄▄   ▟▘▝▙ ▟▘  ▝▙▀▀▀▀▀▀" "▄ ▗▖ ▄█ ▐▌ █▝▀▜▛▀▘  ▝▘  " "▗▄▄▄▄▖ ▗▄▄▖       ▝▀▀▀▀▘" " ▄▄▄▄ ▐▌  ▐▌▝▙▖▗▟▘▝▀▘▝▀▘") #greek
  ;;
  shapes)GLYPH=("  ▗▖   ▄██▄ ▟████▙      " "       ████  ████       " "  ▗▖  ▗▟██▙▖▝▜██▛▘  ▝▘  " "      ▜████▛ ▀██▀   ▝▘  " "  ▁▁   ▟██▙  ▜██▛   ▔▔  " "      ▗▄▄▄▄▖▝▀▀▀▀▘      " "  ▁▁  ▗▄██▄▖▝▀██▀▘  ▔▔  ") # shapes
  ;;
  faces)GLYPH=("▗▄▄▄▄▖▐▄██▄▌▐┼┼┼┼▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▄██▄▌▐▚▇▇▞▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▄██▄▌▐▞▀▀▚▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▄██▄▌▐█▜██▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▇██▄▌▐────▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▇██▇▌▐█  █▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐▄██▄▌▐▖▂▝▗▌▝▀▀▀▀▘") #faces
  ;;
  blocks)GLYPH=("▗▄▄▄▄▖▐████▌▐████▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐████▌▐████▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐████▌▐████▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐████▌▐████▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐████▌▐████▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐████▌▐████▌▝▀▀▀▀▘" "▗▄▄▄▄▖▐████▌▐████▌▝▀▀▀▀▘") #blocks
 esac
 TOTAL="$((HEIGHT * WIDTH))"
 TOGGLE_LEGEND=yes
}

function print_line()
{
 s="$1"
 width=1
 while [[ $width -le $WIDTH ]]
 do
  g="${GRID[x]}"
  G="${GLYPH[g-1]:s:6}"
  echo -ne "${B[x]}\0033[3${g}m ${G} ${n}"
  ((x++))
  [[ $width -lt $WIDTH ]]||echo ""
  ((width++))
 done
}

function print_matrix()
{
 echo -e "\0033[H"
 x=0
 height=1
 while [[ $height -le $HEIGHT ]]
 do
  print_line 0
  x=$((x-WIDTH))
  print_line 6
  x=$((x-WIDTH))
  print_line 12
  x=$((x-WIDTH))
  print_line 18
  ((height++))
 done
 echo -e "$1"
 }

function show_hiscores ()
{
 echo -e "${C1}${b}   T O P   T E N${n}  ${C2}(${WIDTH}x${HEIGHT}, $COLORS colors)${C0}\n"
 if [[ -n $(grep "${WIDTH}x${HEIGHT}, $COLORS colors" "$SHARE_DIR/hiscores.txt")    ]]
 then
  TOP_10_LENGTH=$(grep -c "${WIDTH}x${HEIGHT}, $COLORS colors" "$SHARE_DIR/hiscores.txt")
  if [[ $TOP_10_LENGTH -gt 10 ]];then TOP_10_LENGTH=10;fi
  ii=1;i=1;
  while [[ $i -le $TOP_10_LENGTH ]]
  do
 [[ "$(grep "${WIDTH}x${HEIGHT}, $COLORS colors" "$SHARE_DIR/hiscores.txt" |sort -rn|cat -n|sed -n ${i}p|awk '{print $3,$4}')" == "$WIN_TIME" ]]&&h="${I}"||h=""
  echo -e "${h}\0033[3${ii}m""$(grep "${WIDTH}x${HEIGHT}, $COLORS colors" "$SHARE_DIR/hiscores.txt" |sort -rn|cat -n|sed -n ${i}p|sed 's/@.*//')""${n}"
   sleep 0.2
   ((i++));((ii++))
   [[ $ii -gt 7 ]]&&ii=1
  done
 else echo -e "No statistics available just yet."
 fi
}

function game_over()
{
 clear
 print_matrix
 WIN_TIME="$(date +%Y-%m-%d\ %T)"
 echo -e " ${I}${J}${C1}${b}NO MOVES LEFT, GAME OVER $n\n ${C6}${b}SCORE: ${C5}$SCORE ${n}\n"
 if [[ $(grep -c "${WIDTH}x${HEIGHT}, $COLORS colors" "$SHARE_DIR/hiscores.txt") -lt 1 ]]
 then
  TENTH="$((SCORE-100))"; #avoid first time error
 else
  TENTH="$(sort -rn "$SHARE_DIR/hiscores.txt"|grep "${WIDTH}x${HEIGHT}, $COLORS colors"|head -10|tail -1|awk '{print $1}')"
 fi  
 if [ "$SCORE" -ge "$TENTH" ]||[[ "$(grep -c "${WIDTH}x${HEIGHT}, $COLORS colors" "$SHARE_DIR/hiscores.txt")" -lt 10 ]]
 then
  echo -e "$SCORE\t$WIN_TIME\t@${WIDTH}x${HEIGHT}, $COLORS colors">>"$SHARE_DIR/hiscores.txt"
  echo -e "  ${C6}That's right, you made it to the${n}\n"
  show_hiscores
 fi
 echo -e " ${C0}Press any key to continue$n"
 read -sn 1 xxx
}

function populate_matrix()
{
unset "B[@]"
 unset "POS[@]"
 unset "GRID[@]"
 i=0;ii=0
 while [[ $i -lt $TOTAL ]]
 do
  z="$((1 + RANDOM % $COLORS))"
  B[i]="" #cell background color
  GRID[i]="${z}" #cell value
  POS[i]=$ii #sq position: == 0:left border, == $((WIDTH - 1)): right border, -lt $WIDTH:top border,  -ge $((TOTAL-WIDTH)) bottom border
  ((i++));((ii++))
  [[ $ii == $WIDTH ]]&&ii=0
 done
 B[CURSOR]="${C8}"
}

function new_game()
{
 RESHUFFLES_LEFT="$RESHUFFLE"
 REFRESH=no
 OVER=no
 PLAY=0
 SCORE=0
 SCORE0=0
 CURSOR=0
 MARK="no"
 populate_matrix
}

function solvable_matrix()
{
 SOLVABLE=no
  for ((i=0;i<$TOTAL;i++))
 do
  if [[ ${POS[i]} -lt $((WIDTH-2)) ]] #hor forw
  then
   if [[ ${GRID[i]} -eq ${GRID[i+1]} ]]
   then
    if [[ "$i" -lt $((TOTAL-WIDTH)) ]]&&[[ "${GRID[i]}" -eq "${GRID[i+2+WIDTH]}" ]] #hor forw down
    then 
     SOLVABLE=yes;HINT="$((i+2+WIDTH))";break
    fi
    if [[ "$i" -gt "$((WIDTH-1))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i+2-WIDTH]}" ]] #hor forw up
    then 
     SOLVABLE=yes;HINT="$((i+2-WIDTH))";break 
    fi
   fi
   if [[ ${GRID[i]} -eq ${GRID[i+2]} ]] #hor triangle 
   then
    if [[ "$i" -lt $((TOTAL-WIDTH)) ]]&&[[ "${GRID[i]}" -eq "${GRID[i+1+WIDTH]}" ]] #hor triangle up
    then 
     SOLVABLE=yes;HINT="$((i+1+WIDTH))";break 
    fi
    if [[ "$i" -gt "$((WIDTH-1))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i+1-WIDTH]}" ]] 
    then 
     SOLVABLE=yes;HINT="$((i+1-WIDTH))";break
    fi
   fi
  fi
  if [[ ${POS[i]} -gt 1 ]] ##hor back
  then
   if [[ ${GRID[i]} -eq ${GRID[i-1]} ]]
   then
    if [[ "$i" -lt $((TOTAL-WIDTH)) ]]&&[[ "${GRID[i]}" -eq "${GRID[i-2+WIDTH]}" ]] ##hor back down
    then 
     SOLVABLE=yes;HINT="$((i-2+WIDTH))";break 
    fi
    if [[ "$i" -gt "$((WIDTH-1))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i-2-WIDTH]}" ]] ##hor back up
    then 
     SOLVABLE=yes;HINT="$((i-2-WIDTH))";break
    fi
   fi
  fi
  if [[ $i -lt $((TOTAL-2*WIDTH)) ]] ##vert down
  then
   if [[ ${GRID[i]} -eq ${GRID[i+WIDTH]} ]]
   then
    if [[ "${POS[i]}" -gt 0 ]]&&[[ "${GRID[i]}" -eq "${GRID[i+2*WIDTH-1]}" ]] ##vert down back
    then 
     SOLVABLE=yes;HINT="$((i+2*WIDTH-1))";break 
    fi
    if [[ "${POS[i]}" -lt "$((WIDTH-1))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i+2*WIDTH+1]}" ]] ##hor down forw
    then 
     SOLVABLE=yes;HINT="$((i+2*WIDTH+1))";break 
    fi
   fi
   if [[ ${GRID[i]} -eq ${GRID[i+2*WIDTH]} ]] #vert triangle
   then
    if [[ "${POS[i]}" -gt 0 ]]&&[[ "${GRID[i]}" -eq "${GRID[i+WIDTH-1]}" ]] ##vert triangle back
    then 
     SOLVABLE=yes;HINT="$((i+WIDTH-1))";break 
    fi
    if [[ "${POS[i]}" -lt "$((WIDTH-1))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i+WIDTH+1]}" ]] ##hor down forw
    then 
     SOLVABLE=yes;HINT="$((i+WIDTH+1))";break 
    fi
   fi
  fi
  if [[ $i -ge $((2*WIDTH)) ]] ##vert up
  then
   if [[ ${GRID[i]} -eq ${GRID[i-WIDTH]} ]]
   then
    if [[ "${POS[i]}" -gt 0 ]]&&[[ "${GRID[i]}" -eq "${GRID[i-2*WIDTH-1]}" ]] ##vert up back
    then 
     SOLVABLE=yes;HINT="$((i-2*WIDTH-1))";break 
    fi
    if [[ "${POS[i]}" -lt "$((WIDTH-1))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i-2*WIDTH+1]}" ]] ##ver up forw
    then 
     SOLVABLE=yes;HINT="$((i-2*WIDTH+1))";break
    fi
   fi
  fi
 if [[ "${POS[i]}" -lt "$((WIDTH-3))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i+1]}" ]]&&[[ "${GRID[i]}" -eq "${GRID[i+3]}" ]]
 then
  SOLVABLE=yes;HINT="$((i+3))";break
 fi
 if [[ "${POS[i]}" -gt 2 ]]&&[[ "${GRID[i]}" -eq "${GRID[i-1]}" ]]&&[[ "${GRID[i]}" -eq "${GRID[i-3]}" ]]
  then
   SOLVABLE=yes;HINT="$((i-3))";break
  fi
 if [[ "$i" -lt "$((TOTAL-3*WIDTH))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i+WIDTH]}" ]]&&[[ "${GRID[i]}" -eq "${GRID[i+3*WIDTH]}" ]]
 then
  SOLVABLE=yes;HINT="$((i+3*WIDTH))";break
 fi
 if [[ "$i" -ge "$((3*WIDTH))" ]]&&[[ "${GRID[i]}" -eq "${GRID[i-WIDTH]}" ]]&&[[ "${GRID[i]}" -eq "${GRID[i-3*WIDTH]}" ]]
 then
  SOLVABLE=yes;HINT="$((i-3*WIDTH))";break
 fi
 done
 if [[ "$SOLVABLE" == "no" ]]
 then 
  if [[ "$RESHUFFLES_LEFT" -gt 0 ]]
  then
   echo -e "\0033[H"   
    print_matrix "${C1}${b} NO MOVES LEFT, RESHUFFLES LEFT:${C6}$((RESHUFFLES_LEFT-1))${n}                          "
   sleep 0.5  
   REFRESH=yes 
 else
   OVER=yes
  fi
 fi
}



function mv_cursor ()
{
 B[CURSOR]=""
 B[NEW_CURSOR]="${C8}"
 CURSOR="$NEW_CURSOR"
}

function mv_cell ()
{
 B[CURSOR]=""
 B[NEW_CURSOR]="${C8}"
 CURSOR00=$CURSOR
 SWAP_CELL="${GRID[CURSOR]}"
 GRID[CURSOR]="${GRID[NEW_CURSOR]}"
 GRID[NEW_CURSOR]="$SWAP_CELL"
 CURSOR="$NEW_CURSOR"
 MARK=no
 PLAY=1
 SCORE0="$SCORE"
}

function c_vertical()
{
 HIT=0
 for ((x=0;x<"$WIDTH";x++))
 do
  for ((y=0;y<"$HEIGHT";y++))
  do
  if [[ "${GRID[x+y*WIDTH]}" -ge "$((TOTAL-WIDTH))" ]]||[[ "${GRID[x+y*WIDTH+WIDTH]}" != "${GRID[x+y*WIDTH]}" ]]
  then
   if [[ "$HIT" -gt 1 ]]
   then
    PLAY=0
    ((HIT++))
    for ((i=0;i<$HIT;i++))
    do
     HIT_CELLS+=("$((x+y*WIDTH-i*WIDTH))")
    done
   fi
   HIT=0
  else
   ((HIT++))
  fi
  done
 done
}

function c_horizontal()
{ 
 HIT=0
 for ((x=0;x<"$TOTAL";x++))
 do
  if [[ "${POS[x]}" == "$((WIDTH-1))" ]]||[[ "${GRID[x+1]}" != "${GRID[x]}" ]]
  then
   if [[ "$HIT" -gt 1 ]]
   then
    PLAY=0
    ((HIT++))
    for ((i=0;i<$HIT;i++))
    do
     HIT_CELLS+=("$((x-i))")
    done
   fi  
   HIT=0 
  else   
   ((HIT++))
  fi
 done
}

function cell_drop()
{
 while [[ "$i" -ge $WIDTH ]]
 do
  GRID[i]="${GRID[i-WIDTH]}"
  echo -e "\0033[H"
  print_matrix "${C6}${b} SCORE: ${C5}$SCORE  ${C6}Points : ${C5}+$((SCORE-SCORE0))  ${C6}Reshuffles: ${C5}$RESHUFFLES_LEFT${n}                           "
  i="$((i-WIDTH))"
 done
 GRID[i]="$((1 + RANDOM % $COLORS))"
 echo -e "\0033[H"
 print_matrix "${C6}${b} SCORE: ${C5}$SCORE  ${C6}Points: ${C5}+$((SCORE-SCORE0))  ${C6}Reshuffles: ${C5}$RESHUFFLES_LEFT${n}                           "
}

function check_hit()
{ 
 unset "HIT_CELLS[@]"
 c_horizontal
 c_vertical
 if [[ $PLAY -eq 1 ]]
 then
  print_matrix "${C1}${b} ILLEGAL MOVE                           ${n}"
  sleep 1
  NEW_CURSOR=$CURSOR00
  mv_cell
  PLAY=0
 else
  HIT_POINTS="$((${#HIT_CELLS[@]}*10))"
  SCORE="$((SCORE+HIT_POINTS))"
  HC="$(printf "%s\n" "${HIT_CELLS[@]}"|sort -u -n)"
  HIT_CELLS=($(echo "$HC"))
  for i in "${HIT_CELLS[@]}"
  do
   cell_drop
  done
 fi
 echo -e "\0033[H"
 print_matrix "${C6}${b} SCORE: ${C5}$SCORE  ${C6}Points: ${C5}+$((SCORE-SCORE0))  ${C6}Reshuffles: ${C5}$RESHUFFLES_LEFT${n}                           "
}

function play_legend()
{
 echo -e "${C0}╭───────────────────────────────╮"
 if [[ "$MARK" == no ]]
 then
  echo -e "${C0}│${C5}${b} ${NAV_LEFT}${NAV_DOWN}${NAV_UP}${NAV_RIGHT}/arrows       ${n}${C6}Move cursor${C0} │"
  echo -e "${C0}├───────────────────────────────┤"
  echo -e "${C0}│${C5}${b} space             ${n}${C6}Select cell ${C0}│"
  echo -e "${C0}├───────────────────────────────┤"
  echo -e "${C0}│${C5}${b} z                   ${n}${C6}Show Hint ${C0}│"
  echo -e "${C0}├───────────────────────────────┤"
  echo -e "${C0}│${C5}${b} n                    ${n}${C6}New Game ${C0}│"
  echo -e "${C0}├───────────────────────────────┤" 
  echo -e "${C0}│${C5}${b} m                   ${n}${C6}Main Menu ${C0}│"
  echo -e "${C0}├───────────────────────────────┤"
  echo -e "${C0}│${C5}${b} i                 ${n}${C6}Toggle Info ${C0}│"
  echo -e "${C0}├───────────────────────────────┤"
  echo -e "${C0}│${C5}${b} q                        ${n}${C6}Quit ${C0}│"
 else
  echo -e "${C0}│${C5}${b} ${NAV_LEFT}${NAV_DOWN}${NAV_UP}${NAV_RIGHT}/arrows         ${n}${C2}Move Cell ${C0}│"
   echo -e "${C0}├───────────────────────────────┤"
   echo -e "${C0}│${C5}${b} space                   ${n}${C6}Abort ${C0}│"
 fi
 echo -e "${C0}╰───────────────────────────────╯${n}"
}

function play_menu()
{
 db="";
 while [[ "$db" != "m" ]]&&[[ "$db" != "M" ]]
 do
  SCORE00="$SCORE"
  echo -e "\0033[H"
  print_matrix "${C6}${b} SCORE: ${C5}$SCORE  ${C6}Points: ${C5}+$((SCORE-SCORE0))  ${C6}Reshuffles: ${C5}$RESHUFFLES_LEFT${n}                           "
  check_hit
  solvable_matrix
  [[ $TOGGLE_LEGEND == yes ]]&&play_legend||echo -e "${C0} Hit i to show info"
  if [[ "$SCORE00" != "$SCORE" ]]
  then 
   db="1"
  elif [[ "$REFRESH" == yes ]]
  then
   REFRESH=no
   ((RESHUFFLES_LEFT--))
   populate_matrix
   db="1"
  elif [[ "$OVER" == yes ]]
  then
   game_over
   db=m
  else
   read -sn 1 db
  fi
  [[ $(echo "$db" | od) = "$spacebar" ]]&&db="$spacebar"
  case $db in
   z|Z)[[ $SOLVABLE == yes ]]&&NEW_CURSOR="$HINT";mv_cursor;
   ;;
   n|N)[[ $MARK == no ]]&& db=""&&new_game&&play_menu;
   ;;
   $NAV_UP|A) if  [[ $CURSOR -ge $WIDTH ]]; then NEW_CURSOR=$((CURSOR-WIDTH));[[ $MARK == no ]]&&mv_cursor||mv_cell;fi;
   ;;
   $NAV_DOWN|B) if  [[ $CURSOR -lt $((TOTAL-WIDTH)) ]]; then NEW_CURSOR=$((CURSOR+$WIDTH));[[ $MARK == no ]]&&mv_cursor||mv_cell;fi;
   ;;
   $NAV_RIGHT|C) if  [[ ${POS[CURSOR]} !=  $((WIDTH-1)) ]]; then NEW_CURSOR=$((CURSOR+1));[[ $MARK == no ]]&&mv_cursor||mv_cell;fi;
   ;;
   $NAV_LEFT|D) if  [[ ${POS[CURSOR]} != 0 ]]; then NEW_CURSOR=$((CURSOR-1));[[ $MARK == no ]]&&mv_cursor||mv_cell;fi;
   ;;
   "$spacebar")clear;[[ $MARK == no ]]&& MARK=yes || MARK=no 
   ;;
   I|i)clear;[[ $TOGGLE_LEGEND == no ]]&& TOGGLE_LEGEND=yes || TOGGLE_LEGEND=no 
   ;;
   q|Q)[[ $MARK == no ]]&& clear&&exit
   ;;
   *)
  esac
 done
 clear
}

function main_menu ()
{
clear
 mm=""
 while [[ "$mm" != "q" ]]
 do
  echo -e "${C0}╭────────────────────────╮"
  echo -e "${C0}│   ${C1}${b}T U I P L E T T E  ${n}  ${C0}│"
  echo -e "${C0}├────────────────────────┤"
  echo -e "${C0}│${C5}${b} n             ${n}${C6}New Game ${C0}│"
  echo -e "${C0}├────────────────────────┤"
  echo -e "${C0}│${C5}${b} c            ${n}${C6}Configure ${C0}│"
  echo -e "${C0}├────────────────────────┤"
  echo -e "${C0}│${C5}${b} h           ${n}${C6}Highscores ${C0}│"
  echo -e "${C0}├────────────────────────┤" 
  echo -e "${C0}│${C5}${b} q                 ${n}${C6}Quit ${C0}│"
  echo -e "${C0}╰────────────────────────╯${n}"
  read -sn 1 mm
  case $mm in
   n)clear;new_game; play_menu;
   ;;
   c)clear;eval $PREFERRED_EDITOR $CONFIG_FILE;tput civis;load_config
   ;;
   s)clear;show_hiscores;echo -e "\n ${C0}Press any key to return${n}";read -sN 1 v;clear;
   ;;
   h|H)clear;WIN_TIME="";show_hiscores;echo -e "\n${C0}Press any key to return${n}";read -sN 1 v;clear;
   ;;
   q)clear;
   ;;
   *)clear;
  esac
 done
}

function cursor_reappear() {
echo -e "\0033[?25h"
exit
}

########################################
trap cursor_reappear HUP INT QUIT TERM EXIT ABRT
echo -e "\0033[?25l" # make cursor invisible
spacebar=$(cat << eof
0000000 000012
0000001
eof
)
I="\0033[7m" #invert
J="\0033[5m" #blink
b="\0033[1m" #bold
n="\0033[m"  #reset
CONFIG_FILE="$HOME/.config/matching/matching.config"
SHARE_DIR="$HOME/.local/share/matching"
############## GAME ####################
load_colors
load_config
new_game
main_menu
