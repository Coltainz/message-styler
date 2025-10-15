#!/usr/bin/env bash
# Name: <Colton Anderson>
# Course: CS 3030 (Scripting Languages)
#message styler



#cat > style.sh <<'EOF'
#!/usr/bin/env bash
# Name: Your Name | CS 3030 | Module 2 (Tutorial)

usage() {
  cat <<TXT
Usage: ${0##*/} [-h] [-n NAME]
Options:
  -h        Show this help message
  -n NAME   Greet NAME (default: stranger)
  -c COUNT  Repeat Greeting
Examples:
  ${0##*/} -n Mackenzie
  ${0##*/} -h
  ${0##*/} -c
TXT
}


if [[ "${1:-}" == "-h" ]]; then
  usage
  exit 0
fi


error() {
  echo "Error: $1"
  usage
  exit 2
}

name="stranger"
count=1
upper=false

#taska
#also changed some stuff here for taskb
while getopts ":hn:c:u" opt; do
  case "$opt" in
    h) usage; exit 0 ;;
    n) name="$OPTARG" ;;
    c) count="$OPTARG";;
    u) upper=true;;
    \?) error "Unknown option: -$OPTARG" ;;
    :)  error "Missing argument for -$OPTARG" ;;
  esac
done

shift $((OPTIND-1))
custom="${1:-}"

msg="${custom:-Hello, $name!}"


#taskb
# before getopts       : count=1
# inside getopts string: c:
# inside getopts loop : c) count="$OPTARG" ;;

# after the loop:
# validate: count must be a positive integer (>=1)


if ! [[ "$count" =~ ^[1-9][0-9]*$ ]]; then
error "COUNT must be a positive integer (>=1)."
fi

for ((i=1; i<=count; i++)); do
echo "Hello, $name!"
done


#msg="Hello, $name!"

for ((i=1; i<=count; i++)); do
   if [ "$upper" = true ]; then
       echo "$msg" | tr '[:lower:]' '[:upper:]'
   else
       echo "$msg"
   fi
done 
#EOF



echo "hey"

echo "hi"