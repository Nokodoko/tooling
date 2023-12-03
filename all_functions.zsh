614auth () {
	614='/home/n0ko/.config/neomutt/tokens/cMonty614/' 
	pushd $614
	if [[ -f $614 ]]
	then
		rm cMonty614@gmail.com && ./mutt_oauth2.py cMonty614@gmail.com --authorize
	else
		./mutt_oauth2.py cMonty614@gmail.com --authorize
	fi
}
__arguments () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
__fsel () {
	local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune     -o -type f -print     -o -type d -print     -o -type l -print 2> /dev/null | cut -b3-"}" 
	setopt localoptions pipefail no_aliases 2> /dev/null
	local item
	eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --scheme=path --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_CTRL_T_OPTS-}" $(__fzfcmd) -m "$@" | while read item
	do
		echo -n "${(q)item} "
	done
	local ret=$? 
	echo
	return $ret
}
__fzf_comprun () {
	if [[ "$(type _fzf_comprun 2>&1)" =~ function ]]
	then
		_fzf_comprun "$@"
	elif [ -n "${TMUX_PANE-}" ] && {
			[ "${FZF_TMUX:-0}" != 0 ] || [ -n "${FZF_TMUX_OPTS-}" ]
		}
	then
		shift
		if [ -n "${FZF_TMUX_OPTS-}" ]
		then
			fzf-tmux ${(Q)${(Z+n+)FZF_TMUX_OPTS}} -- "$@"
		else
			fzf-tmux -d ${FZF_TMUX_HEIGHT:-40%} -- "$@"
		fi
	else
		shift
		fzf "$@"
	fi
}
__fzf_extract_command () {
	local token tokens
	tokens=(${(z)1}) 
	for token in $tokens
	do
		token=${(Q)token} 
		if [[ "$token" =~ [[:alnum:]] && ! "$token" =~ "=" ]]
		then
			echo "$token"
			return
		fi
	done
	echo "${tokens[1]}"
}
__fzf_generic_path_completion () {
	local base lbuf cmd compgen fzf_opts suffix tail dir leftover matches
	base=$1 
	lbuf=$2 
	cmd=$(__fzf_extract_command "$lbuf") 
	compgen=$3 
	fzf_opts=$4 
	suffix=$5 
	tail=$6 
	setopt localoptions nonomatch
	if [[ $base = *'$('* ]] || [[ $base = *'<('* ]] || [[ $base = *'>('* ]] || [[ $base = *':='* ]] || [[ $base = *'`'* ]]
	then
		return
	fi
	eval "base=$base" 2> /dev/null || return
	[[ $base = *"/"* ]] && dir="$base" 
	while [ 1 ]
	do
		if [[ -z "$dir" || -d ${dir} ]]
		then
			leftover=${base/#"$dir"} 
			leftover=${leftover/#\/} 
			[ -z "$dir" ] && dir='.' 
			[ "$dir" != "/" ] && dir="${dir/%\//}" 
			matches=$(eval "$compgen $(printf %q "$dir")" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --scheme=path --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_COMPLETION_OPTS-}" __fzf_comprun "$cmd" ${(Q)${(Z+n+)fzf_opts}} -q "$leftover" | while read item; do
        item="${item%$suffix}$suffix"
        echo -n "${(q)item} "
      done) 
			matches=${matches% } 
			if [ -n "$matches" ]
			then
				LBUFFER="$lbuf$matches$tail" 
			fi
			zle reset-prompt
			break
		fi
		dir=$(dirname "$dir") 
		dir=${dir%/}/ 
	done
}
__fzf_list_hosts () {
	setopt localoptions nonomatch
	command cat <(command tail -n +1 ~/.ssh/config ~/.ssh/config.d/* /etc/ssh/ssh_config 2> /dev/null | command grep -i '^\s*host\(name\)\? ' | awk '{for (i = 2; i <= NF; i++) print $1 " " $i}' | command grep -v '[*?%]') <(command grep -oE '^[[a-z0-9.,:-]+' ~/.ssh/known_hosts 2> /dev/null | tr ',' '\n' | tr -d '[' | awk '{ print $1 " " $1 }') <(command grep -v '^\s*\(#\|$\)' /etc/hosts 2> /dev/null | command grep -Fv '0.0.0.0' | command sed 's/#.*//') | awk '{for (i = 2; i <= NF; i++) print $i}' | sort -u
}
__fzfcmd () {
	[ -n "${TMUX_PANE-}" ] && {
		[ "${FZF_TMUX:-0}" != 0 ] || [ -n "${FZF_TMUX_OPTS-}" ]
	} && echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}
__starship_get_time () {
	(( STARSHIP_CAPTURED_TIME = int(rint(EPOCHREALTIME * 1000)) ))
}
_a2ps () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_aap () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_abcde () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_absolute_command_paths () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ack () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_acpi () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_acpitool () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_acroread () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_adb () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_add-zle-hook-widget () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_add-zsh-hook () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_alacritty () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_alias () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_aliases () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_all_labels () {
	local __gopt __len __tmp __pre __suf __ret=1 __descr __spec __prev 
	if [[ "$1" = - ]]
	then
		__prev=- 
		shift
	fi
	__gopt=() 
	zparseopts -D -a __gopt 1 2 V J x
	__tmp=${argv[(ib:4:)-]} 
	__len=$# 
	if [[ __tmp -lt __len ]]
	then
		__pre=$(( __tmp-1 )) 
		__suf=$__tmp 
	elif [[ __tmp -eq $# ]]
	then
		__pre=-2 
		__suf=$(( __len+1 )) 
	else
		__pre=4 
		__suf=5 
	fi
	while comptags "-A$__prev" "$1" curtag __spec
	do
		(( $#funcstack > _tags_level )) && _comp_tags="${_comp_tags% * }" 
		_tags_level=$#funcstack 
		_comp_tags="$_comp_tags $__spec " 
		if [[ "$curtag" = *[^\\]:* ]]
		then
			zformat -f __descr "${curtag#*:}" "d:$3"
			_description "$__gopt[@]" "${curtag%:*}" "$2" "$__descr"
			curtag="${curtag%:*}" 
			"$4" "${(P@)2}" "${(@)argv[5,-1]}" && __ret=0 
		else
			_description "$__gopt[@]" "$curtag" "$2" "$3"
			"${(@)argv[4,__pre]}" "${(P@)2}" "${(@)argv[__suf,-1]}" && __ret=0 
		fi
	done
	return __ret
}
_all_matches () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_alsa-utils () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_alternative () {
	local tags def expl descr action mesgs nm="$compstate[nmatches]" subopts 
	local opt ws curcontext="$curcontext" 
	subopts=() 
	while getopts 'O:C:' opt
	do
		case "$opt" in
			(O) subopts=("${(@P)OPTARG}")  ;;
			(C) curcontext="${curcontext%:*}:$OPTARG"  ;;
		esac
	done
	shift OPTIND-1
	[[ "$1" = -(|-) ]] && shift
	mesgs=() 
	_tags "${(@)argv%%:*}"
	while _tags
	do
		for def
		do
			if _requested "${def%%:*}"
			then
				descr="${${def#*:}%%:*}" 
				action="${def#*:*:}" 
				_description "${def%%:*}" expl "$descr"
				if [[ "$action" = \ # ]]
				then
					mesgs=("$mesgs[@]" "${def%%:*}:$descr") 
				elif [[ "$action" = \(\(*\)\) ]]
				then
					eval ws\=\( "${action[3,-3]}" \)
					_describe -t "${def%%:*}" "$descr" ws -M 'r:|[_-]=* r:|=*' "$subopts[@]"
				elif [[ "$action" = \(*\) ]]
				then
					eval ws\=\( "${action[2,-2]}" \)
					_all_labels "${def%%:*}" expl "$descr" compadd "$subopts[@]" -a - ws
				elif [[ "$action" = \{*\} ]]
				then
					while _next_label "${def%%:*}" expl "$descr"
					do
						eval "$action[2,-2]"
					done
				elif [[ "$action" = \ * ]]
				then
					eval "action=( $action )"
					while _next_label "${def%%:*}" expl "$descr"
					do
						"$action[@]"
					done
				else
					eval "action=( $action )"
					while _next_label "${def%%:*}" expl "$descr"
					do
						"$action[1]" "$subopts[@]" "$expl[@]" "${(@)action[2,-1]}"
					done
				fi
			fi
		done
		[[ nm -ne compstate[nmatches] ]] && return 0
	done
	for descr in "$mesgs[@]"
	do
		_message -e "${descr%%:*}" "${descr#*:}"
	done
	return 1
}
_analyseplugin () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_ansible () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ant () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_antiword () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_apachectl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_apm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_approximate () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_arch_archives () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_arch_namespace () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_archinstallscripts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_arg_compile () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_arguments () {
	local long cmd="$words[1]" descr odescr mesg subopts opt opt2 usecc autod 
	local oldcontext="$curcontext" hasopts rawret optarg singopt alwopt 
	local setnormarg start rest
	local -a match mbegin mend
	integer opt_args_use_NUL_separators=0 
	subopts=() 
	singopt=() 
	while [[ "$1" = -([AMO]*|[0CRSWnsw]) ]]
	do
		case "$1" in
			(-0) opt_args_use_NUL_separators=1 
				shift ;;
			(-C) usecc=yes 
				shift ;;
			(-O) subopts=("${(@P)2}") 
				shift 2 ;;
			(-O*) subopts=("${(@P)${1[3,-1]}}") 
				shift ;;
			(-R) rawret=yes 
				shift ;;
			(-n) setnormarg=yes 
				NORMARG=-1 
				shift ;;
			(-w) optarg=yes 
				shift ;;
			(-W) alwopt=arg 
				shift ;;
			(-[Ss]) singopt+=($1) 
				shift ;;
			(-[AM]) singopt+=($1 $2) 
				shift 2 ;;
			(-[AM]*) singopt+=($1) 
				shift ;;
		esac
	done
	[[ $1 = ':' ]] && shift
	singopt+=(':') 
	[[ "$PREFIX" = [-+] ]] && alwopt=arg 
	long=$argv[(I)--] 
	if (( long ))
	then
		local name tmp tmpargv
		tmpargv=("${(@)argv[1,long-1]}") 
		name=${~words[1]}  2> /dev/null
		[[ "$name" = [^/]*/* ]] && name="$PWD/$name" 
		name="_args_cache_${name}" 
		name="${name//[^a-zA-Z0-9_]/_}" 
		if (( ! ${(P)+name} ))
		then
			local iopts sopts lflag pattern tmpo dir cur cache
			typeset -Ua lopts
			cache=() 
			set -- "${(@)argv[long+1,-1]}"
			iopts=() 
			sopts=() 
			while [[ "$1" = -[lis]* ]]
			do
				if [[ "$1" = -l ]]
				then
					lflag='-l' 
					shift
					continue
				fi
				if [[ "$1" = -??* ]]
				then
					tmp="${1[3,-1]}" 
					cur=1 
				else
					tmp="$2" 
					cur=2 
				fi
				if [[ "$tmp[1]" = '(' ]]
				then
					tmp=(${=tmp[2,-2]}) 
				else
					tmp=("${(@P)tmp}") 
				fi
				if [[ "$1" = -i* ]]
				then
					iopts+=("$tmp[@]") 
				else
					sopts+=("$tmp[@]") 
				fi
				shift cur
			done
			tmp=() 
			_call_program $lflag options ${~words[1]} --help 2>&1 | while IFS= read -r opt
			do
				if (( ${#tmp} ))
				then
					if [[ $opt = [[:space:]][[:space:]][[:space:]]*[[:alpha:]]* ]]
					then
						opt=${opt##[[:space:]]##} 
						lopts+=("${^tmp[@]}":${${${opt//:/-}//\[/(}//\]/)}) 
						tmp=() 
						continue
					else
						lopts+=("${^tmp[@]}":) 
						tmp=() 
					fi
				fi
				while [[ $opt = [,[:space:]]#(#b)(-[^,[:space:]]#)(*) ]]
				do
					start=${match[1]} 
					rest=${match[2]} 
					if [[ -z ${tmp[(r)${start%%[^a-zA-Z0-9_-]#}]} ]]
					then
						if [[ $start = (#b)--\[(*)\](*) ]]
						then
							tmp+=("--${match[1]}${match[2]}" "--${match[2]}") 
						else
							tmp+=($start) 
						fi
					fi
					opt=$rest 
				done
				opt=${opt## [^[:space:]]##  } 
				opt=${opt##[[:space:]]##} 
				if [[ -n $opt ]]
				then
					lopts+=("${^tmp[@]}":${${${opt//:/-}//\[/(}//\]/)}) 
					tmp=() 
				fi
			done
			if (( ${#tmp} ))
			then
				lopts+=("${^tmp[@]}":) 
			fi
			tmp=() 
			for opt in "${(@)${(@)lopts:#--}%%[\[:=]*}"
			do
				let "$tmpargv[(I)(|\([^\)]#\))(|\*)${opt}(|[-+]|=(|-))(|\[*\])(|:*)]" || tmp+=("$lopts[(r)$opt(|[\[:=]*)]") 
			done
			lopts=("$tmp[@]") 
			while (( $#iopts ))
			do
				lopts=(${lopts:#$~iopts[1](|[\[:=]*)}) 
				shift iopts
			done
			while (( $#sopts ))
			do
				lopts+=(${lopts/$~sopts[1]/$sopts[2]}) 
				shift 2 sopts
			done
			argv+=('*=FILE*:file:_files' '*=(DIR|PATH)*:directory:_files -/' '*=*:=: ' '*: :  ') 
			while (( $# ))
			do
				pattern="${${${(M)1#*[^\\]:}[1,-2]}//\\\\:/:}" 
				descr="${1#${pattern}}" 
				if [[ "$pattern" = *\(-\) ]]
				then
					pattern="$pattern[1,-4]" 
					dir=- 
				else
					dir= 
				fi
				shift
				tmp=("${(@M)lopts:##$~pattern:*}") 
				lopts=("${(@)lopts:##$~pattern:*}") 
				(( $#tmp )) || continue
				opt='' 
				tmp=("${(@)tmp%:}") 
				tmpo=("${(@M)tmp:#[^:]##\[\=*}") 
				if (( $#tmpo ))
				then
					tmp=("${(@)tmp:#[^:]##\[\=*}") 
					for opt in "$tmpo[@]"
					do
						if [[ $opt = (#b)(*):([^:]#) ]]
						then
							opt=$match[1] 
							odescr="[${match[2]}]" 
						else
							odescr= 
						fi
						if [[ $opt = (#b)(*)\[\=* ]]
						then
							opt2=${${match[1]}//[^a-zA-Z0-9_-]}=-${dir}${odescr} 
						else
							opt2=${${opt}//[^a-zA-Z0-9_-]}=${dir}${odescr} 
						fi
						if [[ "$descr" = :\=* ]]
						then
							cache+=("${opt2}::${(L)${opt%\]}#*\=}: ") 
						elif [[ "$descr" = ::* ]]
						then
							cache+=("${opt2}${descr}") 
						else
							cache+=("${opt2}:${descr}") 
						fi
					done
				fi
				tmpo=("${(@M)tmp:#[^:]##\=*}") 
				if (( $#tmpo ))
				then
					tmp=("${(@)tmp:#[^:]##\=*}") 
					for opt in "$tmpo[@]"
					do
						if [[ $opt = (#b)(*):([^:]#) ]]
						then
							opt=$match[1] 
							odescr="[${match[2]}]" 
						else
							odescr= 
						fi
						opt2="${${opt%%\=*}//[^a-zA-Z0-9_-]}=${dir}${odescr}" 
						if [[ "$descr" = :\=* ]]
						then
							cache+=("${opt2}:${(L)${opt%\]}#*\=}: ") 
						else
							cache+=("${opt2}${descr}") 
						fi
					done
				fi
				if (( $#tmp ))
				then
					tmp=("${(@)^${(@)tmp:#^*:*}//:/[}]" "${(@)${(@)tmp:#*:*}//[^a-zA-Z0-9_-]}") 
					if [[ -n "$descr" && "$descr" != ': :  ' ]]
					then
						cache+=("${(@)^tmp}${descr}") 
					else
						cache+=("$tmp[@]") 
					fi
				fi
			done
			set -A "$name" "${(@)cache:# #}"
		fi
		set -- "$tmpargv[@]" "${(@P)name}"
	fi
	zstyle -s ":completion:${curcontext}:options" auto-description autod
	if (( $# )) && comparguments -i "$autod" "$singopt[@]" "$@"
	then
		local action noargs aret expl local tried ret=1 
		local next direct odirect equal single matcher matched ws tmp1 tmp2 tmp3
		local opts subc tc prefix suffix descrs actions subcs anum
		local origpre="$PREFIX" origipre="$IPREFIX" nm="$compstate[nmatches]" 
		if comparguments -D descrs actions subcs
		then
			if comparguments -O next direct odirect equal
			then
				opts=yes 
				_tags "$subcs[@]" options
			else
				_tags "$subcs[@]"
			fi
		else
			if comparguments -a
			then
				noargs='no more arguments' 
			else
				noargs='no arguments' 
			fi
			if comparguments -O next direct odirect equal
			then
				opts=yes 
				_tags options
			elif [[ $? -eq 2 ]]
			then
				compadd -Q - "${PREFIX}${SUFFIX}"
				return 0
			else
				_message "$noargs"
				return 1
			fi
		fi
		comparguments -M matcher
		context=() 
		state=() 
		state_descr=() 
		while true
		do
			while _tags
			do
				anum=1 
				if [[ -z "$tried" ]]
				then
					while [[ anum -le $#descrs ]]
					do
						action="$actions[anum]" 
						descr="$descrs[anum]" 
						subc="$subcs[anum++]" 
						if [[ $subc = argument* && -n $setnormarg ]]
						then
							comparguments -n NORMARG
						fi
						if [[ -n "$matched" ]] || _requested "$subc"
						then
							curcontext="${oldcontext%:*}:$subc" 
							_description "$subc" expl "$descr"
							if [[ "$action" = \=\ * ]]
							then
								action="$action[3,-1]" 
								words=("$subc" "$words[@]") 
								(( CURRENT++ ))
							fi
							if [[ "$action" = -\>* ]]
							then
								action="${${action[3,-1]##[ 	]#}%%[ 	]#}" 
								if (( ! $state[(I)$action] ))
								then
									comparguments -W line opt_args $opt_args_use_NUL_separators
									state+=("$action") 
									state_descr+=("$descr") 
									if [[ -n "$usecc" ]]
									then
										curcontext="${oldcontext%:*}:$subc" 
									else
										context+=("$subc") 
									fi
									compstate[restore]='' 
									aret=yes 
								fi
							else
								if [[ -z "$local" ]]
								then
									local line
									typeset -A opt_args
									local=yes 
								fi
								comparguments -W line opt_args $opt_args_use_NUL_separators
								if [[ "$action" = \ # ]]
								then
									_message -e "$subc" "$descr"
									mesg=yes 
									tried=yes 
									alwopt=${alwopt:-yes} 
								elif [[ "$action" = \(\(*\)\) ]]
								then
									eval ws\=\( "${action[3,-3]}" \)
									_describe -t "$subc" "$descr" ws -M "$matcher" "$subopts[@]" || alwopt=${alwopt:-yes} 
									tried=yes 
								elif [[ "$action" = \(*\) ]]
								then
									eval ws\=\( "${action[2,-2]}" \)
									_all_labels "$subc" expl "$descr" compadd "$subopts[@]" -a - ws || alwopt=${alwopt:-yes} 
									tried=yes 
								elif [[ "$action" = \{*\} ]]
								then
									while _next_label "$subc" expl "$descr"
									do
										eval "$action[2,-2]" && ret=0 
									done
									(( ret )) && alwopt=${alwopt:-yes} 
									tried=yes 
								elif [[ "$action" = \ * ]]
								then
									eval "action=( $action )"
									while _next_label "$subc" expl "$descr"
									do
										"$action[@]" && ret=0 
									done
									(( ret )) && alwopt=${alwopt:-yes} 
									tried=yes 
								else
									eval "action=( $action )"
									while _next_label "$subc" expl "$descr"
									do
										"$action[1]" "$subopts[@]" "$expl[@]" "${(@)action[2,-1]}" && ret=0 
									done
									(( ret )) && alwopt=${alwopt:-yes} 
									tried=yes 
								fi
							fi
						fi
					done
				fi
				if _requested options && [[ -z "$hasopts" && -z "$matched" && ( -z "$aret" || "$PREFIX" = "$origpre" ) ]] && {
						! zstyle -T ":completion:${oldcontext%:*}:options" prefix-needed || [[ "$origpre" = [-+]* || -z "$aret$mesg$tried" ]]
					}
				then
					local prevpre="$PREFIX" previpre="$IPREFIX" prevcontext="$curcontext" 
					curcontext="${oldcontext%:*}:options" 
					hasopts=yes 
					PREFIX="$origpre" 
					IPREFIX="$origipre" 
					if [[ -z "$alwopt" || -z "$tried" || "$alwopt" = arg ]] && comparguments -s single
					then
						if [[ "$single" = direct ]]
						then
							_all_labels options expl option compadd -QS '' - "${PREFIX}${SUFFIX}"
						elif [[ -z "$optarg" && "$single" = next ]]
						then
							_all_labels options expl option compadd -Q - "${PREFIX}${SUFFIX}"
						elif [[ "$single" = equal ]]
						then
							_all_labels options expl option compadd -QqS= - "${PREFIX}${SUFFIX}"
						else
							tmp1=("$next[@]" "$direct[@]" "$odirect[@]" "$equal[@]") 
							[[ "$PREFIX" = [-+]* ]] && tmp1=("${(@M)tmp1:#${PREFIX[1]}*}") 
							[[ "$single" = next ]] && tmp1=("${(@)tmp1:#[-+]${PREFIX[-1]}((#e)|:*)}") 
							[[ "$PREFIX" != --* ]] && tmp1=("${(@)tmp1:#--*}") 
							tmp3=("${(M@)tmp1:#[-+]?[^:]*}") 
							tmp1=("${(M@)tmp1:#[-+]?(|:*)}") 
							tmp2=("${PREFIX}${(@M)^${(@)${(@)tmp1%%:*}#[-+]}:#?}") 
							_describe -O option tmp1 tmp2 -S '' -- tmp3
							[[ -n "$optarg" && "$single" = next && nm -eq $compstate[nmatches] ]] && _all_labels options expl option compadd -Q - "${PREFIX}${SUFFIX}"
						fi
						single=yes 
					else
						next+=("$odirect[@]") 
						_describe -O option next -M "$matcher" -- direct -S '' -M "$matcher" -- equal -qS= -M "$matcher"
					fi
					PREFIX="$prevpre" 
					IPREFIX="$previpre" 
					curcontext="$prevcontext" 
				fi
				[[ -n "$tried" && "${${alwopt:+$origpre}:-$PREFIX}" != [-+]* ]] && break
			done
			if [[ -n "$opts" && -z "$aret" && -z "$matched" && ( -z "$tried" || -n "$alwopt" ) && nm -eq compstate[nmatches] ]]
			then
				PREFIX="$origpre" 
				IPREFIX="$origipre" 
				prefix="${PREFIX#*\=}" 
				suffix="$SUFFIX" 
				PREFIX="${PREFIX%%\=*}" 
				SUFFIX='' 
				compadd -M "$matcher" -D equal - "${(@)equal%%:*}"
				if [[ $#equal -eq 1 ]]
				then
					PREFIX="$prefix" 
					SUFFIX="$suffix" 
					IPREFIX="${IPREFIX}${equal[1]%%:*}=" 
					matched=yes 
					comparguments -L "${equal[1]%%:*}" descrs actions subcs
					_tags "$subcs[@]"
					continue
				fi
			fi
			break
		done
		[[ -z "$aret" || -z "$usecc" ]] && curcontext="$oldcontext" 
		if [[ -n "$aret" ]]
		then
			[[ -n $rawret ]] && return 300
		else
			[[ -n "$noargs" && nm -eq "$compstate[nmatches]" ]] && _message "$noargs"
		fi
		[[ nm -ne "$compstate[nmatches]" ]]
	else
		return 1
	fi
}
_arp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_arping () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_arrays () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_asciidoctor () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_asciinema () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_assign () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_at () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_attr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_augeas () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_autocd () {
	_command_names
	local ret=$? 
	[[ -o autocd ]] && _cd || return ret
}
_avahi () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_awk () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_base64 () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_basename () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_basenc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_bash () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bash_complete () {
	local ret=1 
	local -a suf matches
	local -x COMP_POINT COMP_CWORD
	local -a COMP_WORDS COMPREPLY BASH_VERSINFO
	local -x COMP_LINE="$words" 
	local -A savejobstates savejobtexts
	(( COMP_POINT = 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#QIPREFIX + $#IPREFIX + $#PREFIX ))
	(( COMP_CWORD = CURRENT - 1))
	COMP_WORDS=("${words[@]}") 
	BASH_VERSINFO=(2 05b 0 1 release) 
	savejobstates=(${(kv)jobstates}) 
	savejobtexts=(${(kv)jobtexts}) 
	[[ ${argv[${argv[(I)nospace]:-0}-1]} = -o ]] && suf=(-S '') 
	matches=(${(f)"$(compgen $@ -- ${words[CURRENT]})"}) 
	if [[ -n $matches ]]
	then
		if [[ ${argv[${argv[(I)filenames]:-0}-1]} = -o ]]
		then
			compset -P '*/' && matches=(${matches##*/}) 
			compset -S '/*' && matches=(${matches%%/*}) 
			compadd -f "${suf[@]}" -a matches && ret=0 
		else
			compadd "${suf[@]}" - "${(@)${(Q@)matches}:#*\ }" && ret=0 
			compadd -S ' ' - ${${(M)${(Q)matches}:#*\ }% } && ret=0 
		fi
	fi
	if (( ret ))
	then
		if [[ ${argv[${argv[(I)default]:-0}-1]} = -o ]]
		then
			_default "${suf[@]}" && ret=0 
		elif [[ ${argv[${argv[(I)dirnames]:-0}-1]} = -o ]]
		then
			_directories "${suf[@]}" && ret=0 
		fi
	fi
	return ret
}
_bash_completions () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_baudrates () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_baz () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_beep () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bibtex () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bind_addresses () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bindkey () {
	local state expl line curcontext="$curcontext" ret=1 
	typeset -A opt_args
	_arguments -C -s -S '(-v -a -M -l -D -A -N -p)-e[select emacs keymap and bind it to main]' '(-e -a -M -l -D -A -N -p)-v[select viins keymap and bind it to main]' '(-e -v -M -l -D -A -N -p)-a[select vicmd keymap]' '(-e -v -a -l -D -A -N)-M[specify keymap to select]:keymap:->keymap' '(-e -v -a -M -D -A -N -m -p -r -s -R *)-l[list existing keymap names]' '(-e -v -a -d -A -N -m -r -s -R *)-L[output in form of bindkey commands]' '(-e -v -a -l -D -A -N -m -p -r -s -R *)-d[delete existing keymaps and reset to default state]' '(-e -v -a -M -l -d -A -N -m -p -r -s -R *)-D[delete named keymaps]:*:keymap:->keymap' '(-e -v -a -M -l -L -d -D -N -m -p -r -s -R *)-A[create alias to keymap]:old-keymap:->keymap:new-keymap:->keymap' '(-e -v -a -M -l -L -d -D -A -m -p -r -s -R *)-N[create new keymap]:new-keymap:->keymap:old-keymap to copy:->keymap' '(-l -L -d -D -A -N -p -r -s -r -R *)-m[add builtin meta-key bindings to selected keymap]' '(-e -v -a -d -D -A -N -m -s -R *)-p[list bindings which have given key sequence as a prefix]:key sequence' '(-l -L -d -D -A -N -m -s *)-r[unbind specified in-strings]:*:in-string' '(-l -L -d -D -A -N -m -p -r *)-s[bind each in-string to each out-string]:*:key string' '(-e -v -a -M -l -L -d -D -A -N -m -p)-R[interpret in-strings as ranges]' '(-l -L -d -A -N -m -p -r -s):in-string' '(-l -L -d -A -N -m -p -r -s)*::widget:_widgets' && ret=0 
	case $state in
		(keymap) _wanted keymaps expl keymap compadd -a keymaps && ret=0  ;;
	esac
	return ret
}
_bison () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bittorrent () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bluetoothctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_bogofilter () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bootctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_bpf_filters () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bpython () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bq_completer () {
	_completer "CLOUDSDK_COMPONENT_MANAGER_DISABLE_UPDATE_CHECK=1 bq help | grep '^[^ ][^ ]*  ' | sed 's/ .*//'" bq
}
_brace_parameter () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_brctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_btrfs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_builtin () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_busctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_bzip2 () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_bzr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cabal () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cache_invalid () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_cal () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_calendar () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_call_function () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_call_program () {
	local -xi COLUMNS=999 
	local curcontext="${curcontext}" tmp err_fd=-1 clocale='_comp_locale;' 
	local -a prefix
	if [[ "$1" = -p ]]
	then
		shift
		if (( $#_comp_priv_prefix ))
		then
			curcontext="${curcontext%:*}/${${(@M)_comp_priv_prefix:#^*[^\\]=*}[1]}:" 
			zstyle -t ":completion:${curcontext}:${1}" gain-privileges && prefix=($_comp_priv_prefix) 
		fi
	elif [[ "$1" = -l ]]
	then
		shift
		clocale='' 
	fi
	if (( ${debug_fd:--1} > 2 )) || [[ ! -t 2 ]]
	then
		exec {err_fd}>&2
	else
		exec {err_fd}> /dev/null
	fi
	{
		if zstyle -s ":completion:${curcontext}:${1}" command tmp
		then
			if [[ "$tmp" = -* ]]
			then
				eval $clocale "$tmp[2,-1]" "$argv[2,-1]"
			else
				eval $clocale $prefix "$tmp"
			fi
		else
			eval $clocale $prefix "$argv[2,-1]"
		fi 2>&$err_fd
	} always {
		exec {err_fd}>&-
	}
}
_call_whatis () {
	case "$(whatis --version)" in
		("whatis from "*) local -A args
			zparseopts -D -A args s: r:
			apropos "${args[-r]:-"$@"}" | fgrep "($args[-s]" ;;
		(*) whatis "$@" ;;
	esac
}
_canonical_paths () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_capabilities () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_cat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ccal () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_cdcd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cdr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Chpwd
}
_cdrdao () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cdrecord () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_chattr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_chcon () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_chkconfig () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_chmod () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_choom () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_chown () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_chroot () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_chrt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_chsh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cksum () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_clay () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cmdambivalent () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cmdstring () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cmp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_code () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_column () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_combination () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_comm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_command () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_command_names () {
	local args defs expl ffilt
	zstyle -t ":completion:${curcontext}:commands" rehash && rehash
	zstyle -t ":completion:${curcontext}:functions" prefix-needed && [[ $PREFIX != [_.]* ]] && ffilt='[(I)[^_.]*]' 
	defs=('commands:external command:_path_commands') 
	if [[ -n "$path[(r).]" || $PREFIX = */* ]]
	then
		defs+=('executables:executable file:_files -g \*\(-\*\)') 
	else
		_description executables expl 'executable file'
	fi
	if [[ "$1" = -e ]]
	then
		shift
	elif (( ${#precommands:|builtin_precommands} ))
	then
		
	else
		[[ "$1" = - ]] && shift
		defs=("$defs[@]" 'builtins:builtin command:compadd -Qk builtins' "functions:shell function:compadd -k 'functions$ffilt'" 'aliases:alias:compadd -Qk aliases' 'suffix-aliases:suffix alias:_suffix_alias_files' 'reserved-words:reserved word:compadd -Qk reswords' 'jobs:: _jobs -t' 'parameters:: _parameters -g "^*(readonly|association)*" -qS= -r "\n\t\- =[+"' 'parameters:: _parameters -g "*association*~*readonly*" -qS\[ -r "\n\t\- =[+"') 
	fi
	args=("$@") 
	local -a cmdpath
	zstyle -a ":completion:${curcontext}" command-path cmdpath
	if (( ! $#cmdpath && $#_comp_priv_prefix ))
	then
		cmdpath=($path ${path/%\/bin//sbin}) 
		cmdpath=(${(u)^cmdpath}(/-N)) 
	fi
	if (( $#cmdpath ))
	then
		local -a +h path
		local -A +h commands
		path=($cmdpath:A) 
	fi
	_alternative -O args "$defs[@]"
}
_comp_locale () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_compadd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_compdef () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_complete () {
	local comp name oldcontext ret=1 service 
	typeset -T curcontext="$curcontext" ccarray 
	oldcontext="$curcontext" 
	if [[ -n "$compcontext" ]]
	then
		if [[ "${(t)compcontext}" = *array* ]]
		then
			local expl
			_wanted values expl value compadd -a - compcontext
		elif [[ "${(t)compcontext}" = *assoc* ]]
		then
			local expl tmp i
			tmp=() 
			for i in "${(@k)compcontext[(R)*[^[:blank:]]]}"
			do
				tmp=("$tmp[@]" "${i}:${compcontext[$i]}") 
			done
			tmp=("$tmp[@]" "${(k@)compcontext[(R)[[:blank:]]#]}") 
			_describe -t values value tmp
		elif [[ "$compcontext" = *:*:* ]]
		then
			local tag="${${compcontext%%:*}:-values}" 
			local descr="${${${compcontext#${tag}:}%%:*}:-value}" 
			local action="${compcontext#${tag}:${descr}:}" expl ws ret=1 
			case "$action" in
				(\ #) _message -e "$tag" "$descr" ;;
				(\(\(*\)\)) eval ws\=\( "${action[3,-3]}" \)
					_describe -t "$tag" "$descr" ws ;;
				(\(*\)) eval ws\=\( "${action[2,-2]}" \)
					_wanted "$tag" expl "$descr" compadd -a - ws ;;
				(\{*\}) _tags "$tag"
					while _tags
					do
						while _next_label "$tag" expl "$descr"
						do
							eval "$action[2,-2]" && ret=0 
						done
						(( ret )) || break
					done ;;
				(\ *) eval ws\=\( "$action" \)
					_tags "$tag"
					while _tags
					do
						while _next_label "$tag" expl "$descr"
						do
							"$ws[@]"
						done
						(( ret )) || break
					done ;;
				(*) eval ws\=\( "$action" \)
					_tags "$tag"
					while _tags
					do
						while _next_label "$tag" expl "$descr"
						do
							"$ws[1]" "$expl[@]" "${(@)ws[2,-1]}"
						done
						(( ret )) || break
					done ;;
			esac
		else
			ccarray[3]="$compcontext" 
			comp="$_comps[$compcontext]" 
			[[ -n "$comp" ]] && eval "$comp"
		fi
		return
	fi
	comp="$_comps[-first-]" 
	if [[ -n "$comp" ]]
	then
		service="${_services[-first-]:--first-}" 
		ccarray[3]=-first- 
		eval "$comp" && ret=0 
		if [[ "$_compskip" = all ]]
		then
			_compskip= 
			return ret
		fi
	fi
	[[ -n $compstate[vared] ]] && compstate[context]=vared 
	ret=1 
	if [[ "$compstate[context]" = command ]]
	then
		curcontext="$oldcontext" 
		_normal -s && ret=0 
	else
		local cname="-${compstate[context]:s/_/-/}-" 
		ccarray[3]="$cname" 
		comp="$_comps[$cname]" 
		service="${_services[$cname]:-$cname}" 
		if [[ -z "$comp" ]]
		then
			if [[ "$_compskip" = *default* ]]
			then
				_compskip= 
				return 1
			fi
			comp="$_comps[-default-]" 
			service="${_services[-default-]:--default-}" 
		fi
		[[ -n "$comp" ]] && eval "$comp" && ret=0 
	fi
	_compskip= 
	return ret
}
_complete_debug () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_complete_help () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_complete_help_generic () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_complete_tag () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_completer () {
	command=$1 
	name=$2 
	eval '[[ -n "$'"${name}"'_COMMANDS" ]] || '"${name}"'_COMMANDS="$('"${command}"')"'
	set -- $COMP_LINE
	shift
	while [[ $1 == -* ]]
	do
		shift
	done
	[[ -n "$2" ]] && return
	grep -q "${name}\s*$" <<< $COMP_LINE && eval 'COMPREPLY=($'"${name}"'_COMMANDS)' && return
	[[ "$COMP_LINE" == *" " ]] && return
	[[ -n "$1" ]] && eval 'COMPREPLY=($(echo "$'"${name}"'_COMMANDS" | grep ^'"$1"'))'
}
_completers () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_composer () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_compress () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_condition () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_configure () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_coredumpctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_correct () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_correct_filename () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_correct_word () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_cowsay () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cpio () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cplay () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cpupower () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_crontab () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cryptsetup () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_cscope () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_csplit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cssh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ctags () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ctags_tags () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_curl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_cut () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_cvs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_darcs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_date () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_date_formats () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dates () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dbus () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dconf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dcop () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_dd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_default () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_delimiters () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_describe () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_description () {
	local name nopt xopt format gname hidden hide match opts tag
	local -a ign gropt sort
	local -a match mbegin mend
	opts=() 
	xopt=(-X) 
	nopt=() 
	zparseopts -K -D -a nopt 1 2 V=gropt J=ign x=xopt
	3="${${3##[[:blank:]]#}%%[[:blank:]]#}" 
	[[ -n "$3" ]] && _lastdescr=("$_lastdescr[@]" "$3") 
	zstyle -s ":completion:${curcontext}:$1" group-name gname && [[ -z "$gname" ]] && gname="$1" 
	_setup "$1" "${gname:--default-}"
	name="$2" 
	zstyle -s ":completion:${curcontext}:$1" format format || zstyle -s ":completion:${curcontext}:descriptions" format format
	if zstyle -s ":completion:${curcontext}:$1" hidden hidden && [[ "$hidden" = (all|yes|true|1|on) ]]
	then
		[[ "$hidden" = all ]] && format='' 
		opts=(-n) 
	fi
	zstyle -s ":completion:${curcontext}:$1" matcher match && opts=($opts -M "$match") 
	[[ -n "$_matcher" ]] && opts=($opts -M "$_matcher") 
	if [[ -z "$gropt" ]]
	then
		if zstyle -a ":completion:${curcontext}:$1" sort sort || zstyle -a ":completion:${curcontext}:" sort sort
		then
			if [[ -z "${(@)sort:#(match|numeric|reverse)}" ]]
			then
				gropt=(-o ${(j.,.)sort}) 
			elif [[ "$sort" != (yes|true|1|on|menu) ]]
			then
				gropt=(-o nosort) 
			fi
		fi
	else
		gropt=(-o nosort) 
	fi
	if [[ -z "$_comp_no_ignore" ]]
	then
		zstyle -a ":completion:${curcontext}:$1" ignored-patterns _comp_ignore || _comp_ignore=() 
		if zstyle -s ":completion:${curcontext}:$1" ignore-line hidden
		then
			local -a qwords
			qwords=(${words//(#m)[\[\]()\\*?#<>~\^\|]/\\$MATCH}) 
			case "$hidden" in
				(true | yes | on | 1) _comp_ignore+=($qwords)  ;;
				(current) _comp_ignore+=($qwords[CURRENT])  ;;
				(current-shown) [[ "$compstate[old_list]" = *shown* ]] && _comp_ignore+=($qwords[CURRENT])  ;;
				(other) _comp_ignore+=($qwords[1,CURRENT-1] $qwords[CURRENT+1,-1])  ;;
			esac
		fi
		(( $#_comp_ignore )) && opts=(-F _comp_ignore $opts) 
	else
		_comp_ignore=() 
	fi
	tag="$1" 
	shift 2
	if [[ -z "$1" && $# -eq 1 ]]
	then
		format= 
	elif [[ -n "$format" ]]
	then
		if [[ -z $2 ]]
		then
			argv+=(h:${1%%( ##\((#b)([^\)]#[^0-9-][^\)]#)(#B)\)|)( ##\((#b)([0-9-]##)(#B)\)|)( ##\[(#b)([^\]]##)(#B)\]|)}) 
			[[ -n $match[1] ]] && argv+=(m:$match[1]) 
			[[ -n $match[2] ]] && argv+=(r:$match[2]) 
			[[ -n $match[3] ]] && argv+=(o:$match[3]) 
		fi
		zformat -F format "$format" "d:$1" "${(@)argv[2,-1]}"
	fi
	if [[ -n "$gname" ]]
	then
		if [[ -n "$format" ]]
		then
			set -A "$name" "$opts[@]" "$nopt[@]" "$gropt[@]" -J "$gname" "$xopt" "$format"
		else
			set -A "$name" "$opts[@]" "$nopt[@]" "$gropt[@]" -J "$gname"
		fi
	else
		if [[ -n "$format" ]]
		then
			set -A "$name" "$opts[@]" "$nopt[@]" "$gropt[@]" -J -default- "$xopt" "$format"
		else
			set -A "$name" "$opts[@]" "$nopt[@]" "$gropt[@]" -J -default-
		fi
	fi
	if ! (( ${funcstack[2,-1][(I)_description]} ))
	then
		local fakestyle descr
		for fakestyle in fake fake-always
		do
			zstyle -a ":completion:${curcontext}:$tag" $fakestyle match || continue
			descr=("${(@M)match:#*[^\\]:*}") 
			opts=("${(@P)name}") 
			if [[ $fakestyle = fake-always && $opts[1,2] = "-F _comp_ignore" ]]
			then
				shift 2 opts
			fi
			compadd "${(@)opts}" - "${(@)${(@)match:#*[^\\]:*}:s/\\:/:/}"
			(( $#descr )) && _describe -t "$tag" '' descr "${(@)opts}"
		done
	fi
	return 0
}
_devtodo () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_df () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dhclient () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dict () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dict_words () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_diff () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_diff3 () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_diff_options () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_diffstat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dig () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dir_list () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_directories () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_directory_stack () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_dirs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_disable () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_dispatch () {
	local comp pat val name i ret=1 _compskip="$_compskip" 
	local curcontext="$curcontext" service str noskip 
	local -a match mbegin mend
	if [[ "$1" = -s ]]
	then
		noskip=yes 
		shift
	fi
	[[ -z "$noskip" ]] && _compskip= 
	curcontext="${curcontext%:*:*}:${1}:" 
	shift
	if [[ "$_compskip" != (all|*patterns*) ]]
	then
		for str in "$@"
		do
			[[ -n "$str" ]] || continue
			service="${_services[$str]:-$str}" 
			for i in "${(@)_patcomps[(K)$str]}"
			do
				if [[ $i = (#b)"="([^=]#)"="(*) ]]
				then
					service=$match[1] 
					i=$match[2] 
				fi
				eval "$i" && ret=0 
				if [[ "$_compskip" = *patterns* ]]
				then
					break
				elif [[ "$_compskip" = all ]]
				then
					_compskip='' 
					return ret
				fi
			done
		done
	fi
	ret=1 
	for str in "$@"
	do
		[[ -n "$str" ]] || continue
		str=${(Q)str} 
		name="$str" 
		comp="${_comps[$str]}" 
		service="${_services[$str]:-$str}" 
		[[ -z "$comp" ]] || break
	done
	if [[ -n "$comp" && "$name" != "${argv[-1]}" ]]
	then
		_compskip=patterns 
		eval "$comp" && ret=0 
		[[ "$_compskip" = (all|*patterns*) ]] && return ret
	fi
	if [[ "$_compskip" != (all|*patterns*) ]]
	then
		for str
		do
			[[ -n "$str" ]] || continue
			service="${_services[$str]:-$str}" 
			for i in "${(@)_postpatcomps[(K)$str]}"
			do
				_compskip=default 
				eval "$i" && ret=0 
				if [[ "$_compskip" = *patterns* ]]
				then
					break
				elif [[ "$_compskip" = all ]]
				then
					_compskip='' 
					return ret
				fi
			done
		done
	fi
	[[ "$name" = "${argv[-1]}" && -n "$comp" && "$_compskip" != (all|*default*) ]] && service="${_services[$name]:-$name}"  && eval "$comp" && ret=0 
	_compskip='' 
	return ret
}
_django () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dkms () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_dmesg () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dmidecode () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dns_types () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_doas () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_docker () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_docker-machine () {
	# undefined
	builtin autoload -XUz /home/n0ko/.zsh/completion
}
_dog () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_domains () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dos2unix () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_drill () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dropbox () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dsh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dtruss () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_du () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dvi () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_dynamic_directory_name () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_e2label () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_ecasound () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_echotc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_echoti () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_ed () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_elfdump () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_elinks () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_email-notmuch () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_email_addresses () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_emulate () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_enable () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_enscript () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_entr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_env () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_eog () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_equal () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_espeak () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_etags () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ethtool () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_evince () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_exec () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_expand () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_expand_alias () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_expand_word () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_extensions () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_external_pwds () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_eza () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_fakeroot () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_fc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_feh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_fetchmail () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ffmpeg () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_figlet () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_file_descriptors () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_file_modes () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_file_systems () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_files () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_find () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_find_net_interfaces () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_findmnt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_finger () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_first () {
	
}
_flac () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_flex () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_fmt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_fold () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_fortune () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_free () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_fsh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_functions () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_fuse_arguments () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_fuse_values () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_fuser () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_fusermount () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_fzf_compgen_dir () {
	fd --type d --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_path () {
	fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_complete () {
	setopt localoptions ksh_arrays
	local args rest str_arg i sep
	args=("$@") 
	sep= 
	for i in {0..${#args[@]}}
	do
		if [[ "${args[$i]-}" = -- ]]
		then
			sep=$i 
			break
		fi
	done
	if [[ -n "$sep" ]]
	then
		str_arg= 
		rest=("${args[@]:$((sep + 1)):${#args[@]}}") 
		args=("${args[@]:0:$sep}") 
	else
		str_arg=$1 
		args=() 
		shift
		rest=("$@") 
	fi
	local fifo lbuf cmd matches post
	fifo="${TMPDIR:-/tmp}/fzf-complete-fifo-$$" 
	lbuf=${rest[0]} 
	cmd=$(__fzf_extract_command "$lbuf") 
	post="${funcstack[1]}_post" 
	type $post > /dev/null 2>&1 || post=cat 
	_fzf_feed_fifo "$fifo"
	matches=$(FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_COMPLETION_OPTS-} $str_arg" __fzf_comprun "$cmd" "${args[@]}" -q "${(Q)prefix}" < "$fifo" | $post | tr '\n' ' ') 
	if [ -n "$matches" ]
	then
		LBUFFER="$lbuf$matches" 
	fi
	command rm -f "$fifo"
}
_fzf_complete_export () {
	_fzf_complete -m -- "$@" < <(
    declare -xp | sed 's/=.*//' | sed 's/.* //'
  )
}
_fzf_complete_kill () {
	_fzf_complete -m --header-lines=1 --preview 'echo {}' --preview-window down:3:wrap --min-height 15 -- "$@" < <(
    command ps -eo user,pid,ppid,start,time,command 2> /dev/null ||
      command ps -eo user,pid,ppid,time,args # For BusyBox
  )
}
_fzf_complete_kill_post () {
	awk '{print $2}'
}
_fzf_complete_ssh () {
	local tokens=(${(z)1}) 
	case ${tokens[-1]} in
		(-i | -F | -E) _fzf_path_completion "$prefix" "$1" ;;
		(*) local user= 
			[[ $prefix =~ @ ]] && user="${prefix%%@*}@" 
			_fzf_complete +m -- "$@" < <(__fzf_list_hosts | awk -v user="$user" '{print user $0}') ;;
	esac
}
_fzf_complete_telnet () {
	_fzf_complete +m -- "$@" < <(__fzf_list_hosts)
}
_fzf_complete_unalias () {
	_fzf_complete +m -- "$@" < <(
    alias | sed 's/=.*//'
  )
}
_fzf_complete_unset () {
	_fzf_complete -m -- "$@" < <(
    declare -xp | sed 's/=.*//' | sed 's/.* //'
  )
}
_fzf_comprun () {
	local command=$1 
	shift
	case "$command" in
		(cd) fzf "$@" --preview 'tree -C {} | head -200' ;;
		(export | unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
		($ssh) fzf "$@" --preview 'dig {}' ;;
		(*) fzf "$@" ;;
	esac
}
_fzf_dir_completion () {
	__fzf_generic_path_completion "$1" "$2" _fzf_compgen_dir "" "/" ""
}
_fzf_feed_fifo () {
	(
		command rm -f "$1"
		mkfifo "$1"
		cat <&0 > "$1" &
	)
}
_fzf_path_completion () {
	__fzf_generic_path_completion "$1" "$2" _fzf_compgen_path "-m" "" " "
}
_gcc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gcore () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gdb () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_geany () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_gem () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_generic () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_genisoimage () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_getconf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_getent () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_getfacl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_getmail () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_getopt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_ghostscript () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_git () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_global () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_global_tags () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_globflags () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_globqual_delims () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_globquals () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_gnome-gv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_gnu_generic () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gnupod () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gnutls () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_go () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gpasswd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_gpg () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gphoto2 () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gprof () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gqview () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_gradle () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_graphicsmagick () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_grep () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_groff () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_groups () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_growisofs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gsettings () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_guard () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_guilt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_gum () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_gv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_gzip () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_hash () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_have_glob_qual () {
	local complete
	[[ $2 = complete ]] && complete=")" 
	[[ -z $compstate[quote] && ( ( $_comp_caller_options[bareglobqual] == on && $1 = (#b)(((*[^\\\$]|)(\\\\)#)\()([^\)\|\~]#)$complete && ${#match[1]} -gt 1 ) || ( $_comp_caller_options[extendedglob] == on && $1 = (#b)(((*[^\\\$]|)(\\\\)#)"(#q")([^\)]#)$complete ) ) ]]
}
_head () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_hexdump () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_history () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_history_complete_word () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_history_modifiers () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_host () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_hostname () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_hostnamectl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_hosts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_htop () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_iconv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_iconvconfig () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_id () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ifconfig () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_iftop () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ignored () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_imagemagick () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_in_vared () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_init_d () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_initctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_install () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ionice () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_iostat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ip () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ipsec () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ipset () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_iptables () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_irssi () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ispell () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_iwconfig () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_java () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_java_class () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_jira () {
	# undefined
	builtin autoload -XUz /home/n0ko/.zsh/completion
}
_jobs () {
	local expl disp jobs job jids pfx='%' desc how expls sep 
	if [[ "$1" = -t ]]
	then
		zstyle -T ":completion:${curcontext}:jobs" prefix-needed && [[ "$PREFIX" != %* && compstate[nmatches] -ne 0 ]] && return 1
		shift
	fi
	zstyle -t ":completion:${curcontext}:jobs" prefix-hidden && pfx='' 
	zstyle -T ":completion:${curcontext}:jobs" verbose && desc=yes 
	if [[ "$1" = -r ]]
	then
		jids=("${(@k)jobstates[(R)running*]}") 
		shift
		expls='running job' 
	elif [[ "$1" = -s ]]
	then
		jids=("${(@k)jobstates[(R)suspended*]}") 
		shift
		expls='suspended job' 
	else
		[[ "$1" = - ]] && shift
		jids=("${(@k)jobtexts}") 
		expls=job 
	fi
	if [[ -n "$desc" ]]
	then
		disp=() 
		zstyle -s ":completion:${curcontext}:jobs" list-separator sep || sep=-- 
		for job in "$jids[@]"
		do
			[[ -n "$desc" ]] && disp=("$disp[@]" "${pfx}${(r:2:: :)job} $sep ${(r:COLUMNS-8:: :)jobtexts[$job]}") 
		done
	fi
	zstyle -s ":completion:${curcontext}:jobs" numbers how
	if [[ "$how" = (yes|true|on|1) ]]
	then
		jobs=("$jids[@]") 
	else
		local texts i text str tmp num max=0 
		texts=("$jobtexts[@]") 
		jobs=() 
		for i in "$jids[@]"
		do
			text="$jobtexts[$i]" 
			str="${text%% *}" 
			if [[ "$text" = *\ * ]]
			then
				text="${text#* }" 
			else
				text="" 
			fi
			tmp=("${(@M)texts:#${str}*}") 
			num=1 
			while [[ -n "$text" && $#tmp -ge 2 ]]
			do
				str="${str} ${text%% *}" 
				if [[ "$text" = *\ * ]]
				then
					text="${text#* }" 
				else
					text="" 
				fi
				tmp=("${(@M)texts:#${str}*}") 
				(( num++ ))
			done
			[[ num -gt max ]] && max="$num" 
			jobs=("$jobs[@]" "$str") 
		done
		if [[ "$how" = [0-9]## && max -gt how ]]
		then
			jobs=("$jids[@]") 
		else
			[[ -z "$pfx" && -n "$desc" ]] && disp=("${(@)disp#%}") 
		fi
	fi
	if [[ -n "$desc" ]]
	then
		_wanted jobs expl "$expls" compadd "$@" -ld disp - "%$^jobs[@]"
	else
		_wanted jobs expl "$expls" compadd "$@" - "%$^jobs[@]"
	fi
}
_jobs_bg () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_jobs_builtin () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_jobs_fg () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_joe () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_join () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_journalctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_jq () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_kdeconnect () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_kernel-install () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_kfmclient () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_kill () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_killall () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_kitty () {
	(( ${+commands[kitten]} )) || builtin return
	builtin local src cmd=${(F)words:0:$CURRENT}
	src=$(builtin command kitten __complete__ zsh "_matcher=$_matcher" <<<$cmd)  || builtin return
	builtin eval "$src"
}
_knock () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_kpartx () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_kubectl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_kubectx () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_kubens () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_kvno () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_last () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ld_debug () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ldconfig () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ldd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_less () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_lha () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_libinput () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_libvirt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_limit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_limits () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_links () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_list () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_list_files () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_lldb () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ln () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_loadkeys () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_locale () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_localectl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_localedef () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_locales () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_locate () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_logger () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_loginctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_look () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_losetup () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_lp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ls () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_lsattr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_lsblk () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_lsns () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_lsof () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_lsusb () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_ltrace () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_lua () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_luarocks () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_luarocks-admin () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_lynx () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_lz4 () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_lzop () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_machinectl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_mail () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mailboxes () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_main_complete () {
	local IFS=$' \t\n\0' 
	eval "$_comp_setup"
	local func funcs ret=1 tmp _compskip format nm call match min max i num _completers _completer _completer_num curtag _comp_force_list _matchers _matcher _c_matcher _matcher_num _comp_tags _comp_mesg mesg str context state state_descr line opt_args val_args curcontext="$curcontext" _last_nmatches=-1 _last_menu_style _def_menu_style _menu_style sel _tags_level=0 _saved_exact="${compstate[exact]}" _saved_lastprompt="${compstate[last_prompt]}" _saved_list="${compstate[list]}" _saved_insert="${compstate[insert]}" _saved_colors="$ZLS_COLORS" _saved_colors_set=${+ZLS_COLORS} _ambiguous_color='' 
	local _comp_priv_prefix
	unset _comp_priv_prefix
	local -a precommands
	local -ar builtin_precommands=(- builtin eval exec nocorrect noglob time) 
	typeset -U _lastdescr _comp_ignore _comp_colors
	{
		[[ -z "$curcontext" ]] && curcontext=::: 
		zstyle -s ":completion:${curcontext}:" insert-tab tmp || tmp=yes 
		if [[ ( "$tmp" = *pending(|[[:blank:]]*) && PENDING -gt 0 ) || ( "$tmp" = *pending=(#b)([0-9]##)(|[[:blank:]]*) && PENDING -ge $match[1] ) ]]
		then
			compstate[insert]=tab 
			return 0
		fi
		if [[ "$compstate[insert]" = tab* ]]
		then
			if [[ "$tmp" = (|*[[:blank:]])(yes|true|on|1)(|[[:blank:]]*) ]]
			then
				if [[ "$curcontext" != :* || -z "$compstate[vared]" ]] || zstyle -t ":completion:vared${curcontext}:" insert-tab
				then
					return 0
				fi
			fi
			compstate[insert]="${compstate[insert]//tab /}" 
		fi
		if [[ "$compstate[pattern_match]" = "*" && "$_lastcomp[unambiguous]" = "$PREFIX" && -n "$_lastcomp[unambiguous_cursor]" ]]
		then
			integer upos="$_lastcomp[unambiguous_cursor]" 
			SUFFIX="$PREFIX[upos,-1]$SUFFIX" 
			PREFIX="$PREFIX[1,upos-1]" 
		fi
		if [[ -z "$compstate[quote]" ]]
		then
			if [[ -o equals ]] && compset -P 1 '='
			then
				compstate[context]=equal 
			elif [[ "$PREFIX" != */* && "$PREFIX[1]" = '~' ]]
			then
				if [[ "$PREFIX" = '~['[^\]]# ]]
				then
					compset -p 2
					compset -S '\]*'
					compstate[context]=subscript 
					[[ -n $_comps[-subscript-] ]] && $_comps[-subscript-] && return
				else
					compset -p 1
					compstate[context]=tilde 
				fi
			fi
		fi
		_setup default
		_def_menu_style=("$_last_menu_style[@]") 
		_last_menu_style=() 
		if zstyle -s ":completion:${curcontext}:default" list-prompt tmp
		then
			LISTPROMPT="$tmp" 
			zmodload -i zsh/complist
		fi
		if zstyle -s ":completion:${curcontext}:default" select-prompt tmp
		then
			MENUPROMPT="$tmp" 
			zmodload -i zsh/complist
		fi
		if zstyle -s ":completion:${curcontext}:default" select-scroll tmp
		then
			MENUSCROLL="$tmp" 
			zmodload -i zsh/complist
		fi
		if (( $# ))
		then
			if [[ "$1" = - ]]
			then
				if [[ $# -lt 3 ]]
				then
					_completers=() 
				else
					_completers=("$2") 
					call=yes 
				fi
			else
				_completers=("$@") 
			fi
		else
			zstyle -a ":completion:${curcontext}:" completer _completers || _completers=(_complete _ignored) 
		fi
		_completer_num=1 
		integer SECONDS=0 
		TRAPINT () {
			zle -M "Killed by signal in ${funcstack[2]} after ${SECONDS}s"
			zle -R
			return 130
		}
		TRAPQUIT () {
			zle -M "Killed by signal in ${funcstack[2]} after ${SECONDS}s"
			zle -R
			return 131
		}
		funcs=("$compprefuncs[@]") 
		compprefuncs=() 
		for func in "$funcs[@]"
		do
			"$func"
		done
		for tmp in "$_completers[@]"
		do
			if [[ -n "$call" ]]
			then
				_completer="${tmp}" 
			elif [[ "$tmp" = *:-* ]]
			then
				_completer="${${tmp%:*}[2,-1]//_/-}${tmp#*:}" 
				tmp="${tmp%:*}" 
			elif [[ $tmp = *:* ]]
			then
				_completer="${tmp#*:}" 
				tmp="${tmp%:*}" 
			else
				_completer="${tmp[2,-1]//_/-}" 
			fi
			curcontext="${curcontext/:[^:]#:/:${_completer}:}" 
			zstyle -t ":completion:${curcontext}:" show-completer && zle -R "Trying completion for :completion:${curcontext}"
			zstyle -a ":completion:${curcontext}:" matcher-list _matchers || _matchers=('') 
			_matcher_num=1 
			_matcher='' 
			for _c_matcher in "$_matchers[@]"
			do
				if [[ "$_c_matcher" == +* ]]
				then
					_matcher="$_matcher $_c_matcher[2,-1]" 
				else
					_matcher="$_c_matcher" 
				fi
				_comp_mesg= 
				if [[ -n "$call" ]]
				then
					if "${(@)argv[3,-1]}"
					then
						ret=0 
						break 2
					fi
				elif "$tmp"
				then
					ret=0 
					break 2
				fi
				(( _matcher_num++ ))
			done
			[[ -n "$_comp_mesg" ]] && break
			(( _completer_num++ ))
		done
		curcontext="${curcontext/:[^:]#:/::}" 
		if [[ $compstate[old_list] = keep ]]
		then
			nm=$_lastcomp[nmatches] 
		else
			nm=$compstate[nmatches] 
		fi
		if [[ $compstate[old_list] = keep || nm -gt 1 ]]
		then
			[[ _last_nmatches -ge 0 && _last_nmatches -ne nm ]] && _menu_style=("$_last_menu_style[@]" "$_menu_style[@]") 
			tmp=$(( compstate[list_lines] + BUFFERLINES + 1 )) 
			_menu_style=("$_menu_style[@]" "$_def_menu_style[@]") 
			if [[ "$compstate[list]" = *list(| *) && tmp -gt LINES && ( -n "$_menu_style[(r)select=long-list]" || -n "$_menu_style[(r)(yes|true|on|1)=long-list]" ) ]]
			then
				compstate[insert]=menu 
			elif [[ "$compstate[insert]" = "$_saved_insert" ]]
			then
				if [[ -n "$compstate[insert]" && -n "$_menu_style[(r)(yes|true|1|on)=long]" && tmp -gt LINES ]]
				then
					compstate[insert]=menu 
				else
					sel=("${(@M)_menu_style:#(yes|true|1|on)*}") 
					if (( $#sel ))
					then
						min=9999999 
						for i in "$sel[@]"
						do
							if [[ "$i" = *\=[0-9]* ]]
							then
								num="${i#*\=}" 
								[[ num -lt 0 ]] && num=0 
							elif [[ "$i" != *\=* ]]
							then
								num=0 
							else
								num=9999999 
							fi
							[[ num -lt min ]] && min="$num" 
							(( min )) || break
						done
					fi
					sel=("${(@M)_menu_style:#(no|false|0|off)*}") 
					if (( $#sel ))
					then
						max=9999999 
						for i in "$sel[@]"
						do
							if [[ "$i" = *\=[0-9]* ]]
							then
								num="${i#*\=}" 
								[[ num -lt 0 ]] && num=0 
							elif [[ "$i" != *\=* ]]
							then
								num=0 
							else
								num=9999999 
							fi
							[[ num -lt max ]] && max="$num" 
							(( max )) || break
						done
					fi
					if [[ ( -n "$min" && nm -ge min && ( -z "$max" || nm -lt max ) ) || ( -n "$_menu_style[(r)auto*]" && "$compstate[insert]" = automenu ) ]]
					then
						compstate[insert]=menu 
					elif [[ -n "$max" && nm -ge max ]]
					then
						compstate[insert]=unambiguous 
					elif [[ -n "$_menu_style[(r)auto*]" && "$compstate[insert]" != automenu ]]
					then
						compstate[insert]=automenu-unambiguous 
					fi
				fi
			fi
			if [[ "$compstate[insert]" = *menu* ]]
			then
				[[ "$MENUSELECT" = 00 ]] && MENUSELECT=0 
				if [[ -n "$_menu_style[(r)no-select*]" ]]
				then
					unset MENUSELECT
				elif [[ -n "$_menu_style[(r)select=long*]" ]]
				then
					if [[ tmp -gt LINES ]]
					then
						zmodload -i zsh/complist
						MENUSELECT=00 
					fi
				fi
				if [[ "$MENUSELECT" != 00 ]]
				then
					sel=("${(@M)_menu_style:#select*}") 
					if (( $#sel ))
					then
						min=9999999 
						for i in "$sel[@]"
						do
							if [[ "$i" = *\=[0-9]* ]]
							then
								num="${i#*\=}" 
								[[ num -lt 0 ]] && num=0 
							elif [[ "$i" != *\=* ]]
							then
								num=0 
							else
								num=9999999 
							fi
							[[ num -lt min ]] && min="$num" 
							(( min )) || break
						done
						zmodload -i zsh/complist
						MENUSELECT="$min" 
					else
						unset MENUSELECT
					fi
				fi
				if [[ -n "$MENUSELECT" ]]
				then
					if [[ -n "$_menu_style[(r)interactive*]" ]]
					then
						MENUMODE=interactive 
					elif [[ -n "$_menu_style[(r)search*]" ]]
					then
						if [[ -n "$_menu_style[(r)*backward*]" ]]
						then
							MENUMODE=search-backward 
						else
							MENUMODE=search-forward 
						fi
					else
						unset MENUMODE
					fi
				fi
			fi
		elif [[ nm -lt 1 && -n "$_comp_mesg" ]]
		then
			compstate[insert]='' 
			compstate[list]='list force' 
		elif [[ nm -eq 0 && -z "$_comp_mesg" && $#_lastdescr -ne 0 && $compstate[old_list] != keep ]] && zstyle -s ":completion:${curcontext}:warnings" format format
		then
			compstate[list]='list force' 
			compstate[insert]='' 
			tmp=("\`${(@)^_lastdescr:#}'") 
			case $#tmp in
				(1) str="$tmp[1]"  ;;
				(2) str="$tmp[1] or $tmp[2]"  ;;
				(*) str="${(j:, :)tmp[1,-2]}, or $tmp[-1]"  ;;
			esac
			_setup warnings
			zformat -f mesg "$format" "d:$str" "D:${(F)${(@)_lastdescr:#}}"
			compadd -x "$mesg"
		fi
		if [[ -n "$_ambiguous_color" ]]
		then
			local toquote='[=\(\)\|~^?*[\]#<>]' 
			local prefix=${${compstate[unambiguous]}[1,${compstate[unambiguous_cursor]}-1]} 
			[[ -n $prefix ]] && _comp_colors+=("=(#i)${prefix[1,-2]//?/(}${prefix[1,-2]//(#m)?/${MATCH/$~toquote/\\$MATCH}|)}${prefix[-1]//(#m)$~toquote/\\$MATCH}(#b)(?|)*==$_ambiguous_color") 
		fi
		[[ "$_comp_force_list" = always || ( "$_comp_force_list" = ?* && nm -ge _comp_force_list ) ]] && compstate[list]="${compstate[list]//messages} force" 
	} always {
		if [[ "$compstate[old_list]" = keep ]]
		then
			if [[ $_saved_colors_set = 1 ]]
			then
				ZLS_COLORS="$_saved_colors" 
			else
				unset ZLS_COLORS
			fi
		elif (( $#_comp_colors ))
		then
			ZLS_COLORS="${(j.:.)_comp_colors}" 
		else
			unset ZLS_COLORS
		fi
	}
	funcs=("$comppostfuncs[@]") 
	comppostfuncs=() 
	for func in "$funcs[@]"
	do
		"$func"
	done
	_lastcomp=("${(@kv)compstate}") 
	_lastcomp[nmatches]=$nm 
	_lastcomp[completer]="$_completer" 
	_lastcomp[prefix]="$PREFIX" 
	_lastcomp[suffix]="$SUFFIX" 
	_lastcomp[iprefix]="$IPREFIX" 
	_lastcomp[isuffix]="$ISUFFIX" 
	_lastcomp[qiprefix]="$QIPREFIX" 
	_lastcomp[qisuffix]="$QISUFFIX" 
	_lastcomp[tags]="$_comp_tags" 
	return ret
}
_make () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mako () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_makoctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_man () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_mat2 () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_match () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_math () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_math_params () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_matlab () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_md5sum () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mdadm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_mdbook () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_mencal () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_menu () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_mere () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_meson () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_message () {
	local format raw gopt
	if [[ "$1" = -e ]]
	then
		local expl ret=1 tag 
		_comp_mesg=yes 
		if (( $# > 2 ))
		then
			tag="$2" 
			shift
		else
			tag="$curtag" 
		fi
		_tags "$tag" && while _next_label "$tag" expl "$2"
		do
			compadd ${expl:/-X/-x}
			ret=0 
		done
		(( ! $compstate[nmatches] )) && [[ $compstate[insert] = *unambiguous* ]] && compstate[insert]= 
		return ret
	fi
	gopt=() 
	zparseopts -D -a gopt 1 2 V J
	_tags messages || return 1
	if [[ "$1" = -r ]]
	then
		raw=yes 
		shift
		format="$1" 
	else
		zstyle -s ":completion:${curcontext}:messages" format format || zstyle -s ":completion:${curcontext}:descriptions" format format
	fi
	if [[ -n "$format$raw" ]]
	then
		[[ -z "$raw" ]] && zformat -F format "$format" "d:$1" "${(@)argv[2,-1]}"
		builtin compadd "$gopt[@]" -x "$format"
		_comp_mesg=yes 
	fi
}
_mh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mii-tool () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_mime_types () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_minikube () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_mkdir () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mkfifo () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mkinitcpio () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_mknod () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mktemp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_module () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_module_math_func () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_modutils () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_mondo () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_monotone () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_moosic () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mosh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_most_recent_file () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_mount () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mozilla () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_mpc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mplayer () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_mpv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_mt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mtools () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mtr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_multi_parts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_mupdf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_mutt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_my_accounts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_myrepos () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mysql_utils () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_mysqldiff () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_nautilus () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_ncftp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_nedit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_net_interfaces () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_netcat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_netctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_netscape () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_netstat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_networkctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_networkmanager () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_newsgroups () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_next_label () {
	local __gopt __descr __spec
	__gopt=() 
	zparseopts -D -a __gopt 1 2 V J x
	if comptags -A "$1" curtag __spec
	then
		(( $#funcstack > _tags_level )) && _comp_tags="${_comp_tags% * }" 
		_tags_level=$#funcstack 
		_comp_tags="$_comp_tags $__spec " 
		if [[ "$curtag" = *[^\\]:* ]]
		then
			zformat -f __descr "${curtag#*:}" "d:$3"
			_description "$__gopt[@]" "${curtag%:*}" "$2" "$__descr"
			curtag="${curtag%:*}" 
			set -A $2 "${(P@)2}" "${(@)argv[4,-1]}"
		else
			_description "$__gopt[@]" "$curtag" "$2" "$3"
			set -A $2 "${(@)argv[4,-1]}" "${(P@)2}"
		fi
		return 0
	fi
	return 1
}
_next_tags () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_nginx () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ngrep () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ngrok () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_nice () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ninja () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_nkf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_nl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_nm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_nmap () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_normal () {
	local _comp_command1 _comp_command2 _comp_command precommand
	local -A opts
	zparseopts -A opts -D - P p+:-=precommand s
	(( $+opts[-s] )) || _compskip= 
	(( $+opts[-P] )) && precommands=() 
	(( $#precommand )) && precommands+=(${precommand#-p}) 
	if [[ -o BANG_HIST && ( ( $words[CURRENT] = \!*: && -z $compstate[quote] ) || ( $words[CURRENT] = \"\!*: && $compstate[all_quotes] = \" ) ) ]]
	then
		PREFIX=${PREFIX//\\!/!} 
		compset -P '*:'
		_history_modifiers h
		return
	fi
	if [[ CURRENT -eq 1 ]]
	then
		curcontext="${curcontext%:*:*}:-command-:" 
		comp="$_comps[-command-]" 
		[[ -n "$comp" ]] && eval "$comp" && return
		return 1
	fi
	_set_command
	_dispatch ${(k)opts[-s]} "$_comp_command" "$_comp_command1" "$_comp_command2" -default-
}
_nothing () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_notmuch () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_npm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_nsenter () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_nslookup () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_numbers () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_numfmt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_objdump () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_object_files () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_od () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_okular () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_oldlist () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_oomctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_openstack () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_opkg () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_options () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_options_set () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_options_unset () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_opustools () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_other_accounts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pack () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pacman () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_pandoc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_parallel () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_parameter () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_parameters () {
	if compset -P '*:'
	then
		_history_modifiers p
		return
	fi
	local i pfilt
	local -i nm=$compstate[nmatches] 
	local -a expl pattern=(-g \*) normal described verbose faked fakes tmp 
	zstyle -t ":completion:${curcontext}:parameters" prefix-needed && [[ $PREFIX != [_.]* ]] && pfilt='[^_.]' 
	_description parameters expl parameter
	zparseopts -D -K -E g:=pattern
	if zstyle -t ":completion:${curcontext}:parameters" extra-verbose
	then
		described=("${(@M)${(@k)parameters[(R)$~pattern[2]~*(hideval|local|special)*]}:#$~pfilt*}") 
		compadd "$@" "$expl[@]" -D described -a - described
		if (( $#described ))
		then
			verbose=(${${${(f@)"$( typeset -m ${(@b)described} )"}/=/:}[@]//'\'/'\\'}) 
			_describe -t parameters parameter verbose "$@" "$expl[@]"
		fi
		normal=("${(@M)${(@k)parameters[(R)$~pattern[2]~^(*(hideval|special)*)~*local*]}:#$~pfilt*}") 
	else
		normal=("${(@M)${(@k)parameters[(R)$~pattern[2]~*local*]}:#$~pfilt*}") 
	fi
	if zstyle -a ":completion:${curcontext}:" fake-parameters tmp
	then
		for i in "$tmp[@]"
		do
			if [[ "$i" = *:* ]]
			then
				faked=("$faked[@]" "$i") 
			else
				fakes=("$fakes[@]" "$i") 
			fi
		done
	fi
	compadd "$@" "$expl[@]" - "$normal[@]" "${(@)fakes:|described}" "${(@)${(@)${(@M)faked:#${~pattern[2]}}%%:*}:|described}"
	(( compstate[nmatches] > nm ))
}
_paste () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_patch () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_patchutils () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_path_commands () {
	local need_desc expl ret=1 
	if zstyle -t ":completion:${curcontext}:" extra-verbose
	then
		local update_policy first
		if [[ $+_command_descriptions -eq 0 ]]
		then
			first=yes 
			typeset -A -g _command_descriptions
		fi
		zstyle -s ":completion:${curcontext}:" cache-policy update_policy
		[[ -z "$update_policy" ]] && zstyle ":completion:${curcontext}:" cache-policy _path_commands_caching_policy
		if (
				[[ -n $first ]] || _cache_invalid command-descriptions
			) && ! _retrieve_cache command-descriptions
		then
			local line
			for line in "${(f)$(_call_program command-descriptions _call_whatis -s 1 -r .\\\*\; _call_whatis -s 6 -r .\\\* 2>/dev/null)}"
			do
				[[ -n ${line:#(#b)([^ ]#) #\([^ ]#\)( #\[[^ ]#\]|)[ -]#(*)} ]] && continue
				[[ -z $match[1] || -z $match[3] || -z ${${match[1]}:#*:*} ]] && continue
				_command_descriptions[$match[1]]=$match[3] 
			done
			_store_cache command-descriptions _command_descriptions
		fi
		(( $#_command_descriptions )) && need_desc=yes 
	fi
	if [[ -n $need_desc ]]
	then
		typeset -a dcmds descs cmds matches
		local desc cmd sep
		compadd "$@" -O matches -k commands
		for cmd in $matches
		do
			desc=$_command_descriptions[$cmd] 
			if [[ -z $desc ]]
			then
				cmds+=$cmd 
			else
				dcmds+=$cmd 
				descs+="$cmd:$desc" 
			fi
		done
		zstyle -s ":completion:${curcontext}:" list-separator sep || sep=-- 
		zformat -a descs " $sep " $descs
		descs=("${(@r:COLUMNS-1:)descs}") 
		_wanted commands expl 'external command' compadd "$@" -ld descs -a dcmds && ret=0 
		_wanted commands expl 'external command' compadd "$@" -a cmds && ret=0 
	else
		_wanted commands expl 'external command' compadd "$@" -k commands && ret=0 
	fi
	if [[ -o path_dirs ]]
	then
		local -a path_dirs
		if [[ $PREFIX$SUFFIX = */* ]]
		then
			path_dirs=(${path:#.}) 
			_wanted commands expl 'external command' _path_files -W path_dirs -g '*(-*)' && ret=0 
		else
			path_dirs=(${^path}/*(/N:t)) 
			(( ${#path_dirs} )) && _wanted path-dirs expl 'directory in path' compadd "$@" -S / -a path_dirs && ret=0 
		fi
	fi
	return ret
}
_path_commands_caching_policy () {
	local file
	local -a oldp dbfiles
	oldp=("$1"(Nmw+1)) 
	(( $#oldp )) && return 0
	dbfiles=(/usr/share/man/index.(bt|db|dir|pag)(N) /usr/man/index.(bt|db|dir|pag)(N) /var/cache/man/index.(bt|db|dir|pag)(N) /var/catman/index.(bt|db|dir|pag)(N) /usr/share/man/*/whatis(N)) 
	for file in $dbfiles
	do
		[[ $file -nt $1 ]] && return 0
	done
	return 1
}
_path_files () {
	local -a match mbegin mend
	local splitchars
	if zstyle -s ":completion:${curcontext}:" file-split-chars splitchars
	then
		compset -P "*[${(q)splitchars}]"
	fi
	if _have_glob_qual $PREFIX
	then
		local ret=1 
		compset -p ${#match[1]}
		compset -S '[^\)\|\~]#(|\))'
		if [[ $_comp_caller_options[extendedglob] == on ]] && compset -P '\#'
		then
			_globflags && ret=0 
		else
			if [[ $_comp_caller_options[extendedglob] == on ]]
			then
				local -a flags
				flags=('#:introduce glob flag') 
				_describe -t globflags "glob flag" flags -Q -S '' && ret=0 
			fi
			_globquals && ret=0 
		fi
		return ret
	fi
	local linepath realpath donepath prepath testpath exppath skips skipped
	local tmp1 tmp2 tmp3 tmp4 i orig eorig pre suf tpre tsuf opre osuf cpre
	local pats haspats ignore pfx pfxsfx sopt gopt opt sdirs ignpar cfopt listsfx
	local nm=$compstate[nmatches] menu matcher mopts sort mid accex fake 
	local listfiles listopts tmpdisp origtmp1 Uopt
	local accept_exact_dirs path_completion
	integer npathcheck
	local -a Mopts
	typeset -U prepaths exppaths
	exppaths=() 
	zparseopts -a mopts 'P:=pfx' 'S:=pfxsfx' 'q=pfxsfx' 'r:=pfxsfx' 'R:=pfxsfx' 'W:=prepaths' 'F:=ignore' 'M+:=matcher' J+: V+: x+: X+: 1 2 o+: n 'f=tmp1' '/=tmp1' 'g+:-=tmp1'
	sopt="-${(@j::M)${(@)tmp1#-}#?}" 
	(( $tmp1[(I)-[/g]*] )) && haspats=yes 
	(( $tmp1[(I)-g*] )) && gopt=yes 
	if (( $tmp1[(I)-/] ))
	then
		pats="${(@)${(@M)tmp1:#-g*}#-g}" 
		pats=('*(-/)' ${${(z):-x $pats}[2,-1]}) 
	else
		pats="${(@)${(@M)tmp1:#-g*}#-g}" 
		pats=(${${(z):-x $pats}[2,-1]}) 
	fi
	pats=("${(@)pats:# #}") 
	if (( $#pfx ))
	then
		compset -P "${(b)pfx[2]}" || pfxsfx=("$pfx[@]" "$pfxsfx[@]") 
	fi
	if (( $#prepaths ))
	then
		tmp1="${prepaths[2]}" 
		if [[ "$tmp1[1]" = '(' ]]
		then
			prepaths=(${^=tmp1[2,-2]%/}/) 
		elif [[ "$tmp1[1]" = '/' ]]
		then
			prepaths=("${tmp1%/}/") 
		else
			prepaths=(${(P)^tmp1%/}/) 
			(( ! $#prepaths )) && prepaths=(${tmp1%/}/) 
		fi
		(( ! $#prepaths )) && prepaths=('') 
	else
		prepaths=('') 
	fi
	if (( $#ignore ))
	then
		if [[ "${ignore[2]}" = \(* ]]
		then
			ignore=(${=ignore[2][2,-2]}) 
		else
			ignore=(${(P)ignore[2]}) 
		fi
	fi
	if [[ "$sopt" = -(f|) ]]
	then
		if [[ -z "$gopt" ]]
		then
			sopt='-f' 
			pats=('*') 
		else
			unset sopt
		fi
	fi
	if (( ! $mopts[(I)-[JVX]] ))
	then
		local expl
		if [[ -z "$gopt" && "$sopt" = -/ ]]
		then
			_description directories expl directory
		else
			_description files expl file
		fi
		tmp1=$expl[(I)-M*] 
		if (( tmp1 ))
		then
			if (( $#matcher ))
			then
				matcher[2]="$matcher[2] $expl[1+tmp1]" 
			else
				matcher=(-M "$expl[1+tmp1]") 
			fi
		fi
		mopts=("$mopts[@]" "$expl[@]") 
	fi
	[[ -z "$_comp_no_ignore" && $#ignore -eq 0 && ( -z $gopt || "$pats" = \ #\*\ # ) && -n $FIGNORE ]] && ignore=("?*${^fignore[@]}") 
	if (( $#ignore ))
	then
		_comp_ignore=("$_comp_ignore[@]" "$ignore[@]") 
		(( $mopts[(I)-F] )) || mopts=("$mopts[@]" -F _comp_ignore) 
	fi
	if [[ $#matcher -eq 0 && -o nocaseglob ]]
	then
		matcher=(-M 'm:{a-zA-Z}={A-Za-z}') 
	fi
	if (( $#matcher ))
	then
		mopts=("$mopts[@]" "$matcher[@]") 
	fi
	if zstyle -s ":completion:${curcontext}:" file-sort tmp1
	then
		case "$tmp1" in
			(*size*) sort=oL  ;;
			(*links*) sort=ol  ;;
			(*(time|date|modi)*) sort=om  ;;
			(*access*) sort=oa  ;;
			(*(inode|change)*) sort=oc  ;;
			(*) sort=on  ;;
		esac
		[[ "$tmp1" = *rev* ]] && sort[1]=O 
		[[ "$tmp1" = *follow* ]] && sort="-${sort}-" 
		if [[ "$sort" = on ]]
		then
			sort= 
		else
			mopts=(-o nosort "${mopts[@]}") 
			tmp2=() 
			for tmp1 in "$pats[@]"
			do
				if _have_glob_qual "$tmp1" complete
				then
					tmp2+=("${match[1]}#q${sort})(${match[5]})") 
				else
					tmp2+=("${tmp1}(${sort})") 
				fi
			done
			pats=("$tmp2[@]") 
		fi
	fi
	if zstyle -t ":completion:${curcontext}:paths" squeeze-slashes
	then
		skips='((.|..|)/)##' 
	else
		skips='((.|..)/)##' 
	fi
	zstyle -s ":completion:${curcontext}:paths" special-dirs sdirs
	zstyle -t ":completion:${curcontext}:paths" list-suffixes && listsfx=yes 
	[[ "$pats" = ((|*[[:blank:]])\*(|[[:blank:]]*|\([^[:blank:]]##\))|*\([^[:blank:]]#/[^[:blank:]]#\)*) ]] && sopt=$sopt/ 
	zstyle -a ":completion:${curcontext}:paths" accept-exact accex
	zstyle -a ":completion:${curcontext}:" fake-files fake
	zstyle -s ":completion:${curcontext}:" ignore-parents ignpar
	zstyle -t ":completion:${curcontext}:paths" accept-exact-dirs && accept_exact_dirs=1 
	zstyle -T ":completion:${curcontext}:paths" path-completion && path_completion=1 
	if [[ -n "$compstate[pattern_match]" ]]
	then
		if {
				[[ -z "$SUFFIX" ]] && _have_glob_qual "$PREFIX" complete
			} || _have_glob_qual "$SUFFIX" complete
		then
			tmp3=${match[5]} 
			if [[ -n "$SUFFIX" ]]
			then
				SUFFIX=${match[2]} 
			else
				PREFIX=${match[2]} 
			fi
			tmp2=() 
			for tmp1 in "$pats[@]"
			do
				if _have_glob_qual "$tmp1" complete
				then
					tmp2+=("${match[1]}${tmp3}${match[5]})") 
				else
					tmp2+=("${tmp1}(${tmp3})") 
				fi
			done
			pats=("$tmp2[@]") 
		fi
	fi
	pre="$PREFIX" 
	suf="$SUFFIX" 
	opre="$PREFIX" 
	osuf="$SUFFIX" 
	orig="${PREFIX}${SUFFIX}" 
	eorig="$orig" 
	[[ $compstate[insert] = (*menu|[0-9]*) || -n "$_comp_correct" || ( -n "$compstate[pattern_match]" && "${orig#\~}" != (|*[^\\])[][*?#~^\|\<\>]* ) ]] && menu=yes 
	if [[ -n "$_comp_correct" ]]
	then
		cfopt=- 
		Uopt=-U 
	else
		Mopts=(-M "r:|/=* r:|=*") 
	fi
	if [[ "$pre" = [^][*?#^\|\<\>\\]#(\`[^\`]#\`|\$)*/* && "$compstate[quote]" != \' ]]
	then
		linepath="${(M)pre##*\$[^/]##/}" 
		() {
			setopt localoptions nounset
			eval 'realpath=${(e)~linepath}' 2> /dev/null
		}
		[[ -z "$realpath" || "$realpath" = "$linepath" ]] && return 1
		pre="${pre#${linepath}}" 
		i='[^/]' 
		i="${#linepath//$i}" 
		orig="${orig[1,(in:i:)/][1,-2]}" 
		donepath= 
		prepaths=('') 
	elif [[ "$pre[1]" = \~ && "$compstate[quote]" = (|\`) ]]
	then
		linepath="${pre[2,-1]%%/*}" 
		if [[ -z "$linepath" ]]
		then
			realpath="${HOME%/}/" 
		elif [[ "$linepath" = ([-+]|)[0-9]## ]]
		then
			if [[ "$linepath" != [-+]* ]]
			then
				tmp1="$linepath" 
			else
				if [[ "$linepath" = -* ]]
				then
					tmp1=$(( $#dirstack $linepath )) 
				else
					tmp1=$linepath[2,-1] 
				fi
				[[ -o pushdminus ]] && tmp1=$(( $#dirstack - $tmp1 )) 
			fi
			if (( ! tmp1 ))
			then
				realpath=$PWD/ 
			elif [[ tmp1 -le $#dirstack ]]
			then
				realpath=$dirstack[tmp1]/ 
			else
				_message 'not enough directory stack entries'
				return 1
			fi
		elif [[ "$linepath" = [-+] ]]
		then
			realpath=${~:-\~$linepath}/ 
		else
			eval "realpath=~${linepath}/" 2> /dev/null
			if [[ -z "$realpath" ]]
			then
				_message "unknown user \`$linepath'"
				return 1
			fi
		fi
		linepath="~${linepath}/" 
		[[ "$realpath" = "$linepath" ]] && return 1
		pre="${pre#*/}" 
		orig="${orig#*/}" 
		donepath= 
		prepaths=('') 
	else
		linepath= 
		realpath= 
		if zstyle -s ":completion:${curcontext}:" preserve-prefix tmp1 && [[ -n "$tmp1" && "$pre" = (#b)(${~tmp1})* ]]
		then
			pre="$pre[${#match[1]}+1,-1]" 
			orig="$orig[${#match[1]}+1,-1]" 
			donepath="$match[1]" 
			prepaths=('') 
		elif [[ "$pre[1]" = / ]]
		then
			pre="$pre[2,-1]" 
			orig="$orig[2,-1]" 
			donepath='/' 
			prepaths=('') 
		else
			[[ "$pre" = (.|..)/* ]] && prepaths=('') 
			donepath= 
		fi
	fi
	for prepath in "$prepaths[@]"
	do
		skipped= 
		cpre= 
		if [[ ( -n $accept_exact_dirs || -z $path_completion ) && ${pre} = (#b)(*)/([^/]#) ]]
		then
			tmp1=${match[1]} 
			tpre=${match[2]} 
			tmp2=$tmp1 
			tmp1=${tmp1//(#b)\\(?)/$match[1]} 
			tpre=${tpre//(#b)\\([^\\\]\[\^\~\(\)\#\*\?])/$match[1]} 
			tmp3=${donepath//(#b)\\(?)/$match[1]} 
			while true
			do
				if [[ -z $path_completion || -d $prepath$realpath$tmp3$tmp2 ]]
				then
					tmp3=$tmp3$tmp1/ 
					donepath=${tmp3//(#b)([\\\]\[\^\~\(\)\#\*\?])/\\$match[1]} 
					pre=$tpre 
					break
				elif [[ $tmp1 = (#b)(*)/([^/]#) ]]
				then
					tmp1=$match[1] 
					tpre=$match[2]/$tpre 
				else
					break
				fi
			done
		fi
		tpre="$pre" 
		tsuf="$suf" 
		testpath="${donepath//(#b)\\([\\\]\[\^\~\(\)\#\*\?])/$match[1]}" 
		tmp2="${(M)tpre##${~skips}}" 
		tpre="${tpre#$tmp2}" 
		tmp1=("$prepath$realpath$donepath$tmp2") 
		(( npathcheck = 0 ))
		while true
		do
			origtmp1=("${tmp1[@]}") 
			if [[ "$tpre" = */* ]]
			then
				PREFIX="${tpre%%/*}" 
				SUFFIX= 
			else
				PREFIX="${tpre}" 
				SUFFIX="${tsuf%%/*}" 
			fi
			tmp2=("$tmp1[@]") 
			if [[ "$tpre$tsuf" = (#b)*/(*) ]]
			then
				if [[ -n "$fake${match[1]}" ]]
				then
					compfiles -P$cfopt tmp1 accex "$skipped" "$_matcher $matcher[2]" "$sdirs" fake
				else
					compfiles -P$cfopt tmp1 accex "$skipped" "$_matcher $matcher[2]" '' fake
				fi
			elif [[ "$sopt" = *[/f]* ]]
			then
				compfiles -p$cfopt tmp1 accex "$skipped" "$_matcher $matcher[2]" "$sdirs" fake "$pats[@]"
			else
				compfiles -p$cfopt tmp1 accex "$skipped" "$_matcher $matcher[2]" '' fake "$pats[@]"
			fi
			tmp1=($~tmp1)  2> /dev/null
			if [[ -n "$PREFIX$SUFFIX" ]]
			then
				if (( ! $#tmp1 && npathcheck == 0 ))
				then
					(( npathcheck = 1 ))
					for tmp3 in "$tmp2[@]"
					do
						if [[ -n $tmp3 && $tmp3 != */ ]]
						then
							tmp3+=/ 
						fi
						if [[ -e "$tmp3${(Q)PREFIX}${(Q)SUFFIX}" ]]
						then
							(( npathcheck = 2 ))
						fi
					done
					if (( npathcheck == 2 ))
					then
						tmp1=("$origtmp1[@]") 
						continue
					fi
				fi
				if (( ! $#tmp1 ))
				then
					tmp2=(${^${tmp2:#/}}/$PREFIX$SUFFIX) 
				elif [[ "$tmp1[1]" = */* ]]
				then
					if [[ -n "$_comp_correct" ]]
					then
						tmp2=("$tmp1[@]") 
						builtin compadd -D tmp1 "$matcher[@]" - "${(@)tmp1:t}"
						if [[ $#tmp1 -eq 0 ]]
						then
							tmp1=("$tmp2[@]") 
							compadd -D tmp1 "$matcher[@]" - "${(@)tmp2:t}"
						fi
					else
						tmp2=("$tmp1[@]") 
						compadd -D tmp1 "$matcher[@]" - "${(@)tmp1:t}"
					fi
				else
					tmp2=('') 
					compadd -D tmp1 "$matcher[@]" -a tmp1
				fi
				if (( ! $#tmp1 ))
				then
					if [[ "$tmp2[1]" = */* ]]
					then
						tmp2=("${(@)tmp2#${prepath}${realpath}}") 
						if [[ "$tmp2[1]" = */* ]]
						then
							tmp2=("${(@)tmp2:h}") 
							compquote tmp2
							if [[ "$tmp2" = */ ]]
							then
								exppaths=("$exppaths[@]" ${^tmp2}${tpre}${tsuf}) 
							else
								exppaths=("$exppaths[@]" ${^tmp2}/${tpre}${tsuf}) 
							fi
						elif [[ ${tpre}${tsuf} = */* ]]
						then
							exppaths=("$exppaths[@]" ${tpre}${tsuf}) 
						fi
					fi
					continue 2
				fi
			elif (( ! $#tmp1 ))
			then
				if [[ -z "$tpre$tsuf" && -n "$pre$suf" ]]
				then
					pfxsfx=(-S '' "$pfxsfx[@]") 
				elif [[ -n "$haspats" && -z "$tpre$tsuf$suf" && "$pre" = */ ]]
				then
					PREFIX="${opre}" 
					SUFFIX="${osuf}" 
					compadd -nQS '' - "$linepath$donepath$orig"
					tmp4=- 
				fi
				continue 2
			fi
			if [[ -n "$ignpar" && -z "$_comp_no_ignore" && "$tpre$tsuf" != */* && $#tmp1 -ne 0 && ( "$ignpar" != *dir* || "$pats" = '*(-/)' ) && ( "$ignpar" != *..* || "$tmp1[1]" = *../* ) ]]
			then
				compfiles -i tmp1 ignore "$ignpar" "$prepath$realpath$donepath"
				_comp_ignore+=(${(@)ignore#$prepath$realpath$donepath}) 
				(( $#_comp_ignore && ! $mopts[(I)-F] )) && mopts=("$mopts[@]" -F _comp_ignore) 
			fi
			if [[ "$tpre" = */* ]]
			then
				tpre="${tpre#*/}" 
			elif [[ "$tsuf" = */* ]]
			then
				tpre="${tsuf#*/}" 
				tsuf= 
			else
				break
			fi
			tmp2="${(M)tpre##${~skips}}" 
			if [[ -n "$tmp2" ]]
			then
				skipped="/$tmp2" 
				tpre="${tpre#$tmp2}" 
			else
				skipped=/ 
			fi
			(( npathcheck = 0 ))
		done
		tmp3="$pre$suf" 
		tpre="$pre" 
		tsuf="$suf" 
		if [[ -n "${prepath}${realpath}${testpath}" ]]
		then
			if [[ -o nocaseglob ]]
			then
				tmp1=("${(@)tmp1#(#i)${prepath}${realpath}${testpath}}") 
			else
				tmp1=("${(@)tmp1#${prepath}${realpath}${testpath}}") 
			fi
		fi
		while true
		do
			compfiles -r tmp1 "${(Q)tmp3}"
			tmp4=$? 
			if [[ "$tpre" = */* ]]
			then
				tmp2="${cpre}${tpre%%/*}" 
				PREFIX="${linepath}${donepath}${tmp2}" 
				SUFFIX="/${tpre#*/}${tsuf#*/}" 
			else
				tmp2="${cpre}${tpre}" 
				PREFIX="${linepath}${donepath}${tmp2}" 
				SUFFIX="${tsuf}" 
			fi
			if (( tmp4 ))
			then
				tmp2="$testpath" 
				if [[ -n "$linepath" ]]
				then
					compquote -p tmp2 tmp1
				elif [[ -n "$tmp2" ]]
				then
					compquote -p tmp1
					compquote tmp2
				else
					compquote tmp1 tmp2
				fi
				if [[ -z "$_comp_correct" && "$compstate[pattern_match]" = \* && -n "$listsfx" && "$tmp2" = (|*[^\\])[][*?#~^\|\<\>]* ]]
				then
					PREFIX="$opre" 
					SUFFIX="$osuf" 
				fi
				if [[ -z "$compstate[insert]" ]] || {
						! zstyle -t ":completion:${curcontext}:paths" expand suffix && [[ -z "$listsfx" && ( -n "$_comp_correct" || -z "$compstate[pattern_match]" || "$SUFFIX" != */* || "${SUFFIX#*/}" = (|*[^\\])[][*?#~^\|\<\>]* ) ]]
					}
				then
					(( tmp4 )) && zstyle -t ":completion:${curcontext}:paths" ambiguous && compstate[to_end]= 
					if [[ "$tmp3" = */* ]]
					then
						if [[ -z "$listsfx" || "$tmp3" != */?* ]]
						then
							tmp1=("${(@)tmp1%%/*}") 
							_list_files tmp1 "$prepath$realpath$testpath"
							compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -s "/${tmp3#*/}${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts $listopts -a tmp1
						else
							tmp1=("${(@)^tmp1%%/*}/${tmp3#*/}") 
							_list_files tmp1 "$prepath$realpath$testpath"
							compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -s "${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts $listopts -a tmp1
						fi
					else
						_list_files tmp1 "$prepath$realpath$testpath"
						compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -s "${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts $listopts -a tmp1
					fi
				else
					if [[ "$tmp3" = */* ]]
					then
						tmp4=($Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts) 
						if [[ -z "$listsfx" ]]
						then
							for i in "$tmp1[@]"
							do
								tmpdisp=("$i") 
								_list_files tmpdisp "$prepath$realpath$testpath"
								compadd "$tmp4[@]" -s "${Uopt:+$ISUFFIX}" $listopts - "$tmpdisp"
							done
						else
							[[ -n "$compstate[pattern_match]" ]] && SUFFIX="${SUFFIX:gs./.*/}*" 
							for i in "$tmp1[@]"
							do
								_list_files i "$prepath$realpath$testpath"
								compadd "$tmp4[@]" $listopts - "$i"
							done
						fi
					else
						_list_files tmp1 "$prepath$realpath$testpath"
						compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -s "${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts $listopts -a tmp1
					fi
				fi
				tmp4=- 
				break
			fi
			if [[ "$tmp3" != */* ]]
			then
				tmp4= 
				break
			fi
			testpath="${testpath}${tmp1[1]%%/*}/" 
			tmp3="${tmp3#*/}" 
			if [[ "$tpre" = */* ]]
			then
				if [[ -z "$_comp_correct" && -n "$compstate[pattern_match]" && "$tmp2" = (|*[^\\])[][*?#~^\|\<\>]* ]]
				then
					cpre="${cpre}${tmp1[1]%%/*}/" 
				else
					cpre="${cpre}${tpre%%/*}/" 
				fi
				tpre="${tpre#*/}" 
			elif [[ "$tsuf" = */* ]]
			then
				[[ "$tsuf" != /* ]] && mid="$testpath" 
				if [[ -z "$_comp_correct" && -n "$compstate[pattern_match]" && "$tmp2" = (|*[^\\])[][*?#~^\|\<\>]* ]]
				then
					cpre="${cpre}${tmp1[1]%%/*}/" 
				else
					cpre="${cpre}${tpre}/" 
				fi
				tpre="${tsuf#*/}" 
				tsuf= 
			else
				tpre= 
				tsuf= 
			fi
			tmp1=("${(@)tmp1#*/}") 
		done
		if [[ -z "$tmp4" ]]
		then
			if [[ "$mid" = */ ]]
			then
				PREFIX="${opre}" 
				SUFFIX="${osuf}" 
				tmp4="${testpath#${mid}}" 
				if [[ $mid = */*/* ]]
				then
					tmp3="${mid%/*/}" 
					tmp2="${${mid%/}##*/}" 
					if [[ -n "$linepath" ]]
					then
						compquote -p tmp3
					else
						compquote tmp3
					fi
					compquote tmp4 tmp2 tmp1
					for i in "$tmp1[@]"
					do
						_list_files tmp2 "$prepath$realpath${mid%/*/}"
						compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp3/" -s "/$tmp4$i${Uopt:+$ISUFFIX}" -W "$prepath$realpath${mid%/*/}/" "$pfxsfx[@]" $Mopts $listopts - "$tmp2"
					done
				else
					tmp2="${${mid%/}##*/}" 
					compquote tmp4 tmp2 tmp1
					for i in "$tmp1[@]"
					do
						_list_files tmp2 "$prepath$realpath${mid%/*/}"
						compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath" -s "/$tmp4$i${Uopt:+$ISUFFIX}" -W "$prepath$realpath" "$pfxsfx[@]" $Mopts $listopts - "$tmp2"
					done
				fi
			else
				if [[ "$osuf" = */* ]]
				then
					PREFIX="${opre}${osuf}" 
					SUFFIX= 
				else
					PREFIX="${opre}" 
					SUFFIX="${osuf}" 
				fi
				tmp4="$testpath" 
				if [[ -n "$linepath" ]]
				then
					compquote -p tmp4 tmp1
				elif [[ -n "$tmp4" ]]
				then
					compquote -p tmp1
					compquote tmp4
				else
					compquote tmp4 tmp1
				fi
				if [[ -z "$_comp_correct" && -n "$compstate[pattern_match]" && "${PREFIX#\~}$SUFFIX" = (|*[^\\])[][*?#~^\|\<\>]* ]]
				then
					tmp1=("$linepath$tmp4${(@)^tmp1}") 
					_list_files tmp1 "$prepath$realpath"
					compadd -Qf -W "$prepath$realpath" "$pfxsfx[@]" "$mopts[@]" -M "r:|/=* r:|=*" $listopts -a tmp1
				else
					_list_files tmp1 "$prepath$realpath$testpath"
					compadd $Uopt -Qf -p "${Uopt:+$IPREFIX}$linepath$tmp4" -s "${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" "$mopts[@]" $Mopts $listopts -a tmp1
				fi
			fi
		fi
	done
	if [[ _matcher_num -eq ${#_matchers} ]] && zstyle -t ":completion:${curcontext}:paths" expand prefix && [[ nm -eq compstate[nmatches] && $#exppaths -ne 0 && "$linepath$exppaths" != "$eorig" ]]
	then
		PREFIX="${opre}" 
		SUFFIX="${osuf}" 
		compadd -Q "$mopts[@]" -S '' -M "r:|/=* r:|=*" -p "$linepath" -a exppaths
	fi
	[[ nm -ne compstate[nmatches] ]]
}
_pax () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pbm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pdf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pdftk () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_perf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_perforce () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_perl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_perl_basepods () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_perl_modules () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_perldoc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pgids () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pgrep () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_php () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pick_variant () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_picocom () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pidof () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_pids () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pine () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ping () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pkg-config () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pkg_instance () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pkgadd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pkginfo () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pkgrm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pmap () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_polybar () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_polybar_msg () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_pon () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ports () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_postfix () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_postgresql () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_postscript () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_precommand () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_prefix () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_print () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_printenv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_printers () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_process_names () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_prompt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_prove () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ps () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ps1234 () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_pspdf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_psutils () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ptx () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pulseaudio () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_pump () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pwgen () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_pydoc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_python () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_python_argcomplete () {
	local prefix= 
	if [[ $COMP_LINE == 'gcloud '* ]]
	then
		if [[ $3 == ssh && $2 == *@* ]]
		then
			prefix=${2%@*}@ 
			COMP_LINE=${COMP_LINE%$2}"${2#*@}" 
		elif [[ $2 == *'='* ]]
		then
			prefix=${2%=*}'=' 
			COMP_LINE=${COMP_LINE%$2}${2/'='/' '} 
		fi
	fi
	local IFS='' 
	COMPREPLY=($(IFS="$IFS"                   COMP_LINE="$COMP_LINE"                   COMP_POINT="$COMP_POINT"                   _ARGCOMPLETE_COMP_WORDBREAKS="$COMP_WORDBREAKS"                   _ARGCOMPLETE=1                   "$1" 8>&1 9>&2 1>/dev/null 2>/dev/null)) 
	if [[ $? != 0 ]]
	then
		unset COMPREPLY
		return
	fi
	if [[ ${#COMPREPLY[@]} == 1 && $COMPREPLY != *[=' '] ]]
	then
		COMPREPLY+=' ' 
	fi
	if [[ $prefix != '' ]]
	then
		typeset -i n
		for ((n=0; n < ${#COMPREPLY[@]}; n++)) do
			COMPREPLY[$n]=$prefix${COMPREPLY[$n]} 
		done
	fi
}
_python_modules () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_qdbus () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_qemu () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_qiv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_quilt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rake () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ranlib () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rar () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rclone () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rcs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rdesktop () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_read () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_read_comp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_readelf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_readlink () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_redirect () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_regex_arguments () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_regex_words () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_remote_files () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_renice () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_requested () {
	local __gopt
	__gopt=() 
	zparseopts -D -a __gopt 1 2 V J x
	if comptags -R "$1"
	then
		if [[ $# -gt 3 ]]
		then
			_all_labels - "$__gopt[@]" "$@" || return 1
		elif [[ $# -gt 1 ]]
		then
			_description "$__gopt[@]" "$@"
		fi
		return 0
	else
		return 1
	fi
}
_resolvectl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_retrieve_cache () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_ri () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rlogin () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rmdir () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_route () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rrdtool () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rsync () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_rubber () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ruby () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_run-help () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_runit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_samba () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sccs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sched () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_schedtool () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_scons () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_screen () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_script () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sd_hosts_or_user_at_host () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_sd_machines () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_sd_outputmodes () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_sd_unit_files () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_seafile () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sed () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_selinux_contexts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_selinux_roles () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_selinux_types () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_selinux_users () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_sep_parts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_seq () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sequence () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_service () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_services () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_set () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_set_command () {
	local command
	command="$words[1]" 
	[[ -z "$command" ]] && return
	if (( $+builtins[$command] + $+functions[$command] ))
	then
		_comp_command1="$command" 
		_comp_command="$_comp_command1" 
	elif [[ "$command[1]" = '=' ]]
	then
		eval _comp_command2\=$command
		_comp_command1="$command[2,-1]" 
		_comp_command="$_comp_command2" 
	elif [[ "$command" = ..#/* ]]
	then
		_comp_command1="${PWD}/$command" 
		_comp_command2="${command:t}" 
		_comp_command="$_comp_command2" 
	elif [[ "$command" = */* ]]
	then
		_comp_command1="$command" 
		_comp_command2="${command:t}" 
		_comp_command="$_comp_command2" 
	else
		_comp_command1="$command" 
		_comp_command2="$commands[$command]" 
		_comp_command="$_comp_command1" 
	fi
}
_setfacl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_setopt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_setpriv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_setsid () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_setup () {
	local val nm="$compstate[nmatches]" 
	[[ $# -eq 1 ]] && 2="$1" 
	if zstyle -a ":completion:${curcontext}:$1" list-colors val
	then
		zmodload -i zsh/complist
		if [[ "$1" = default ]]
		then
			_comp_colors=("$val[@]") 
		else
			_comp_colors+=("(${2})${(@)^val:#(|\(*\)*)}" "${(M@)val:#\(*\)*}") 
		fi
	elif [[ "$1" = default ]]
	then
		unset ZLS_COLORS ZLS_COLOURS
	fi
	if zstyle -s ":completion:${curcontext}:$1" show-ambiguity val
	then
		zmodload -i zsh/complist
		[[ $val = (yes|true|on) ]] && _ambiguous_color=4  || _ambiguous_color=$val 
	fi
	if zstyle -t ":completion:${curcontext}:$1" list-packed
	then
		compstate[list]="${compstate[list]} packed" 
	elif [[ $? -eq 1 ]]
	then
		compstate[list]="${compstate[list]:gs/packed//}" 
	else
		compstate[list]="$_saved_list" 
	fi
	if zstyle -t ":completion:${curcontext}:$1" list-rows-first
	then
		compstate[list]="${compstate[list]} rows" 
	elif [[ $? -eq 1 ]]
	then
		compstate[list]="${compstate[list]:gs/rows//}" 
	else
		compstate[list]="$_saved_list" 
	fi
	if zstyle -t ":completion:${curcontext}:$1" last-prompt
	then
		compstate[last_prompt]=yes 
	elif [[ $? -eq 1 ]]
	then
		compstate[last_prompt]='' 
	else
		compstate[last_prompt]="$_saved_lastprompt" 
	fi
	if zstyle -t ":completion:${curcontext}:$1" accept-exact
	then
		compstate[exact]=accept 
	elif [[ $? -eq 1 ]]
	then
		compstate[exact]='' 
	else
		compstate[exact]="$_saved_exact" 
	fi
	[[ _last_nmatches -ge 0 && _last_nmatches -ne nm ]] && _menu_style=("$_last_menu_style[@]" "$_menu_style[@]") 
	if zstyle -a ":completion:${curcontext}:$1" menu val
	then
		_last_nmatches=$nm 
		_last_menu_style=("$val[@]") 
	else
		_last_nmatches=-1 
	fi
	[[ "$_comp_force_list" != always ]] && zstyle -s ":completion:${curcontext}:$1" force-list val && [[ "$val" = always || ( "$val" = [0-9]## && ( -z "$_comp_force_list" || _comp_force_list -gt val ) ) ]] && _comp_force_list="$val" 
}
_setxkbmap () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_sh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_shasum () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_showmount () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_shred () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_shtab () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_shuf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_shutdown () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_signals () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sisu () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_slabtop () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_slrn () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_smartmontools () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_socket () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sort () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_source () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_spamassassin () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_split () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sqlite () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sqsh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ss () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_ssh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ssh_hosts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sshfs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_starship () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_stat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_stdbuf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_stgit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_store_cache () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_stow () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_strace () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_strftime () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_strings () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_strip () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_stty () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_su () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sub_commands () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_sublimetext () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_subscript () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_subversion () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sudo () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_suffix_alias_files () {
	local expl pat
	(( ${#saliases} )) || return 1
	if (( ${#saliases} == 1 ))
	then
		pat="*.${(kq)saliases}" 
	else
		local -a tmpa
		tmpa=(${(kq)saliases}) 
		pat="*.(${(kj.|.)tmpa})" 
	fi
	_path_files "$@" -g $pat
}
_surfraw () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_swaks () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_swanctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_swift () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sys_calls () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sysctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_sysstat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_systemctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_systemd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_systemd-analyze () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_systemd-delta () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_systemd-inhibit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_systemd-nspawn () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_systemd-path () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_systemd-run () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_systemd-tmpfiles () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_tac () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tags () {
	local prev
	if [[ "$1" = -- ]]
	then
		prev=- 
		shift
	fi
	if (( $# ))
	then
		local curcontext="$curcontext" order tag nodef tmp 
		if [[ "$1" = -C?* ]]
		then
			curcontext="${curcontext%:*}:${1[3,-1]}" 
			shift
		elif [[ "$1" = -C ]]
		then
			curcontext="${curcontext%:*}:${2}" 
			shift 2
		fi
		[[ "$1" = -(|-) ]] && shift
		zstyle -a ":completion:${curcontext}:" group-order order && compgroups "$order[@]"
		comptags "-i$prev" "$curcontext" "$@"
		if [[ -n "$_sort_tags" ]]
		then
			"$_sort_tags" "$@"
		else
			zstyle -a ":completion:${curcontext}:" tag-order order || (( ! ${@[(I)options]} )) || order=('(|*-)argument-* (|*-)option[-+]* values' options) 
			for tag in $order
			do
				case $tag in
					(-) nodef=yes  ;;
					(\!*) comptry "${(@)argv:#(${(j:|:)~${=~tag[2,-1]}})}" ;;
					(?*) comptry -m "$tag" ;;
				esac
			done
			[[ -z "$nodef" ]] && comptry "$@"
		fi
		comptags "-T$prev"
		return
	fi
	comptags "-N$prev"
}
_tail () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tar () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tar_archive () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tardy () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tcpdump () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tcpsys () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_tcptraceroute () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tee () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_telnet () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_terminals () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_terraform () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_tex () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_texi () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_texinfo () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tidy () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tiff () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tilde () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_tilde_files () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_time_zone () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_timedatectl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_timeout () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tin () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tla () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tldr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_tload () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_tmux () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_todo.sh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_toilet () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_top () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_topgit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_totd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_touch () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tpb () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_tput () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tracepath () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_transmission () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_trap () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_tree () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_truncate () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_truss () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tty () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_ttyctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_ttys () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_tune2fs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_twidge () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_twisted () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_typeset () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_udevadm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_ulimit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_uml () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_umountable () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_unace () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_uname () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_unexpand () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_unhash () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_uniq () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_unison () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_units () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_unshare () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_uptime () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_urls () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_urxvt () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_user_admin () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_user_at_host () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_user_expand () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_user_math_func () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_users () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_users_on () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_valgrind () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_value () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_values () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Base
}
_vared () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_vars () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_vcs_info () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_vcs_info_hooks () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_vi () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_vim () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_visudo () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_vmstat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_vnc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_vorbis () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_vpnc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_vserver () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_w () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_w3m () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_wait () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_wakeup_capable_devices () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_wanted () {
	local -a __targs __gopt
	zparseopts -D -a __gopt 1 2 V J x C:=__targs
	_tags "$__targs[@]" "$1"
	while _tags
	do
		_all_labels "$__gopt[@]" "$@" && return 0
	done
	return 1
}
_watch () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_wc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_webbrowser () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_wezterm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_wget () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_whereis () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_which () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_who () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_whois () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_widgets () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_wiggle () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_wipefs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_wl-copy () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_wl-paste () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_wpa_cli () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Linux
}
_wpctl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_x_arguments () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_borderwidth () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_color () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_colormapid () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_cursor () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_display () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_extension () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_font () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_geometry () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_keysym () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_locale () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_modifier () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_name () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_resource () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_selection_timeout () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_title () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_utils () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_visual () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_x_window () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xargs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_xauth () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xautolock () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xclip () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xdvi () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xfig () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xft_fonts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xinput () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xloadimage () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xmlsoft () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_xmlstarlet () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_xmms2 () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_xmodmap () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xournal () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xpdf () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xrandr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xscreensaver () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xset () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xt_arguments () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xt_session_id () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xterm () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xwit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_xxd () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_xz () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_yafc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_yay () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_yodl () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_yp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_yt-dlp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_zargs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zathura () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_zattr () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zcalc () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zcalc_line () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zcat () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_zcompile () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zdump () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_zeal () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/X
}
_zed () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zellij () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/site-functions
}
_zfs () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_zfs_dataset () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_zfs_pool () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_zftp () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zip () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_zle () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zmodload () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zmv () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zparseopts () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zpty () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zsh () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Unix
}
_zsh-mime-handler () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zsh_autosuggest_accept () {
	local -i retval max_cursor_pos=$#BUFFER 
	if [[ "$KEYMAP" = "vicmd" ]]
	then
		max_cursor_pos=$((max_cursor_pos - 1)) 
	fi
	if (( $CURSOR != $max_cursor_pos || !$#POSTDISPLAY ))
	then
		_zsh_autosuggest_invoke_original_widget $@
		return
	fi
	BUFFER="$BUFFER$POSTDISPLAY" 
	unset POSTDISPLAY
	_zsh_autosuggest_invoke_original_widget $@
	retval=$? 
	if [[ "$KEYMAP" = "vicmd" ]]
	then
		CURSOR=$(($#BUFFER - 1)) 
	else
		CURSOR=$#BUFFER 
	fi
	return $retval
}
_zsh_autosuggest_async_request () {
	zmodload zsh/system 2> /dev/null
	typeset -g _ZSH_AUTOSUGGEST_ASYNC_FD _ZSH_AUTOSUGGEST_CHILD_PID
	if [[ -n "$_ZSH_AUTOSUGGEST_ASYNC_FD" ]] && {
			true <&$_ZSH_AUTOSUGGEST_ASYNC_FD
		} 2> /dev/null
	then
		exec {_ZSH_AUTOSUGGEST_ASYNC_FD}<&-
		zle -F $_ZSH_AUTOSUGGEST_ASYNC_FD
		if [[ -n "$_ZSH_AUTOSUGGEST_CHILD_PID" ]]
		then
			if [[ -o MONITOR ]]
			then
				kill -TERM -$_ZSH_AUTOSUGGEST_CHILD_PID 2> /dev/null
			else
				kill -TERM $_ZSH_AUTOSUGGEST_CHILD_PID 2> /dev/null
			fi
		fi
	fi
	exec {_ZSH_AUTOSUGGEST_ASYNC_FD}< <(
		# Tell parent process our pid
		echo $sysparams[pid]

		# Fetch and print the suggestion
		local suggestion
		_zsh_autosuggest_fetch_suggestion "$1"
		echo -nE "$suggestion"
	)
	autoload -Uz is-at-least
	is-at-least 5.8 || command true
	read _ZSH_AUTOSUGGEST_CHILD_PID <&$_ZSH_AUTOSUGGEST_ASYNC_FD
	zle -F "$_ZSH_AUTOSUGGEST_ASYNC_FD" _zsh_autosuggest_async_response
}
_zsh_autosuggest_async_response () {
	emulate -L zsh
	local suggestion
	if [[ -z "$2" || "$2" == "hup" ]]
	then
		IFS='' read -rd '' -u $1 suggestion
		zle autosuggest-suggest -- "$suggestion"
		exec {1}<&-
	fi
	zle -F "$1"
}
_zsh_autosuggest_bind_widget () {
	typeset -gA _ZSH_AUTOSUGGEST_BIND_COUNTS
	local widget=$1 
	local autosuggest_action=$2 
	local prefix=$ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX 
	local -i bind_count
	case $widgets[$widget] in
		(user:_zsh_autosuggest_(bound|orig)_*) bind_count=$((_ZSH_AUTOSUGGEST_BIND_COUNTS[$widget]))  ;;
		(user:*) _zsh_autosuggest_incr_bind_count $widget
			zle -N $prefix$bind_count-$widget ${widgets[$widget]#*:} ;;
		(builtin) _zsh_autosuggest_incr_bind_count $widget
			eval "_zsh_autosuggest_orig_${(q)widget}() { zle .${(q)widget} }"
			zle -N $prefix$bind_count-$widget _zsh_autosuggest_orig_$widget ;;
		(completion:*) _zsh_autosuggest_incr_bind_count $widget
			eval "zle -C $prefix$bind_count-${(q)widget} ${${(s.:.)widgets[$widget]}[2,3]}" ;;
	esac
	eval "_zsh_autosuggest_bound_${bind_count}_${(q)widget}() {
		_zsh_autosuggest_widget_$autosuggest_action $prefix$bind_count-${(q)widget} \$@
	}"
	zle -N -- $widget _zsh_autosuggest_bound_${bind_count}_$widget
}
_zsh_autosuggest_bind_widgets () {
	emulate -L zsh
	local widget
	local ignore_widgets
	ignore_widgets=(.\* _\* ${_ZSH_AUTOSUGGEST_BUILTIN_ACTIONS/#/autosuggest-} $ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX\* $ZSH_AUTOSUGGEST_IGNORE_WIDGETS) 
	for widget in ${${(f)"$(builtin zle -la)"}:#${(j:|:)~ignore_widgets}}
	do
		if [[ -n ${ZSH_AUTOSUGGEST_CLEAR_WIDGETS[(r)$widget]} ]]
		then
			_zsh_autosuggest_bind_widget $widget clear
		elif [[ -n ${ZSH_AUTOSUGGEST_ACCEPT_WIDGETS[(r)$widget]} ]]
		then
			_zsh_autosuggest_bind_widget $widget accept
		elif [[ -n ${ZSH_AUTOSUGGEST_EXECUTE_WIDGETS[(r)$widget]} ]]
		then
			_zsh_autosuggest_bind_widget $widget execute
		elif [[ -n ${ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS[(r)$widget]} ]]
		then
			_zsh_autosuggest_bind_widget $widget partial_accept
		else
			_zsh_autosuggest_bind_widget $widget modify
		fi
	done
}
_zsh_autosuggest_bound_1_accept-and-hold () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-and-hold $@
}
_zsh_autosuggest_bound_1_accept-and-infer-next-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-and-infer-next-history $@
}
_zsh_autosuggest_bound_1_accept-and-menu-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-and-menu-complete $@
}
_zsh_autosuggest_bound_1_accept-line () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-accept-line $@
}
_zsh_autosuggest_bound_1_accept-line-and-down-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-line-and-down-history $@
}
_zsh_autosuggest_bound_1_accept-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-search $@
}
_zsh_autosuggest_bound_1_apps () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-apps $@
}
_zsh_autosuggest_bound_1_argument-base () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-argument-base $@
}
_zsh_autosuggest_bound_1_auto-suffix-remove () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-auto-suffix-remove $@
}
_zsh_autosuggest_bound_1_auto-suffix-retain () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-auto-suffix-retain $@
}
_zsh_autosuggest_bound_1_autosuggest-capture-completion () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-autosuggest-capture-completion $@
}
_zsh_autosuggest_bound_1_backward-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-char $@
}
_zsh_autosuggest_bound_1_backward-delete-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-delete-char $@
}
_zsh_autosuggest_bound_1_backward-delete-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-delete-word $@
}
_zsh_autosuggest_bound_1_backward-kill-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-kill-line $@
}
_zsh_autosuggest_bound_1_backward-kill-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-kill-word $@
}
_zsh_autosuggest_bound_1_backward-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-word $@
}
_zsh_autosuggest_bound_1_beginning-of-buffer-or-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-beginning-of-buffer-or-history $@
}
_zsh_autosuggest_bound_1_beginning-of-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-beginning-of-history $@
}
_zsh_autosuggest_bound_1_beginning-of-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-beginning-of-line $@
}
_zsh_autosuggest_bound_1_beginning-of-line-hist () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-beginning-of-line-hist $@
}
_zsh_autosuggest_bound_1_bracketed-paste () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-bracketed-paste $@
}
_zsh_autosuggest_bound_1_capitalize-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-capitalize-word $@
}
_zsh_autosuggest_bound_1_clear-screen () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-clear-screen $@
}
_zsh_autosuggest_bound_1_complete-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-complete-word $@
}
_zsh_autosuggest_bound_1_config () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-config $@
}
_zsh_autosuggest_bound_1_copy-prev-shell-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-copy-prev-shell-word $@
}
_zsh_autosuggest_bound_1_copy-prev-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-copy-prev-word $@
}
_zsh_autosuggest_bound_1_copy-region-as-kill () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-copy-region-as-kill $@
}
_zsh_autosuggest_bound_1_deactivate-region () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-deactivate-region $@
}
_zsh_autosuggest_bound_1_delete-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-delete-char $@
}
_zsh_autosuggest_bound_1_delete-char-or-list () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-delete-char-or-list $@
}
_zsh_autosuggest_bound_1_delete-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-delete-word $@
}
_zsh_autosuggest_bound_1_describe-key-briefly () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-describe-key-briefly $@
}
_zsh_autosuggest_bound_1_digit-argument () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-digit-argument $@
}
_zsh_autosuggest_bound_1_down-case-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-down-case-word $@
}
_zsh_autosuggest_bound_1_down-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-down-history $@
}
_zsh_autosuggest_bound_1_down-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-down-line $@
}
_zsh_autosuggest_bound_1_down-line-or-history () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-down-line-or-history $@
}
_zsh_autosuggest_bound_1_down-line-or-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-down-line-or-search $@
}
_zsh_autosuggest_bound_1_edit-command-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-edit-command-line $@
}
_zsh_autosuggest_bound_1_emacs-backward-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-emacs-backward-word $@
}
_zsh_autosuggest_bound_1_emacs-forward-word () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-emacs-forward-word $@
}
_zsh_autosuggest_bound_1_end-of-buffer-or-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-end-of-buffer-or-history $@
}
_zsh_autosuggest_bound_1_end-of-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-end-of-history $@
}
_zsh_autosuggest_bound_1_end-of-line () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-end-of-line $@
}
_zsh_autosuggest_bound_1_end-of-line-hist () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-end-of-line-hist $@
}
_zsh_autosuggest_bound_1_end-of-list () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-end-of-list $@
}
_zsh_autosuggest_bound_1_exchange-point-and-mark () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-exchange-point-and-mark $@
}
_zsh_autosuggest_bound_1_exconf () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-exconf $@
}
_zsh_autosuggest_bound_1_execute-last-named-cmd () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-execute-last-named-cmd $@
}
_zsh_autosuggest_bound_1_execute-named-cmd () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-execute-named-cmd $@
}
_zsh_autosuggest_bound_1_expand-cmd-path () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-cmd-path $@
}
_zsh_autosuggest_bound_1_expand-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-history $@
}
_zsh_autosuggest_bound_1_expand-or-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-or-complete $@
}
_zsh_autosuggest_bound_1_expand-or-complete-prefix () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-or-complete-prefix $@
}
_zsh_autosuggest_bound_1_expand-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-word $@
}
_zsh_autosuggest_bound_1_forward-char () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-forward-char $@
}
_zsh_autosuggest_bound_1_forward-word () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-forward-word $@
}
_zsh_autosuggest_bound_1_fzf-cd-widget () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-fzf-cd-widget $@
}
_zsh_autosuggest_bound_1_fzf-completion () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-fzf-completion $@
}
_zsh_autosuggest_bound_1_fzf-file-widget () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-fzf-file-widget $@
}
_zsh_autosuggest_bound_1_fzf-history-widget () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-fzf-history-widget $@
}
_zsh_autosuggest_bound_1_get-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-get-line $@
}
_zsh_autosuggest_bound_1_gosmacs-transpose-chars () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-gosmacs-transpose-chars $@
}
_zsh_autosuggest_bound_1_history-beginning-search-backward () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-history-beginning-search-backward $@
}
_zsh_autosuggest_bound_1_history-beginning-search-forward () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-history-beginning-search-forward $@
}
_zsh_autosuggest_bound_1_history-incremental-pattern-search-backward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-history-incremental-pattern-search-backward $@
}
_zsh_autosuggest_bound_1_history-incremental-pattern-search-forward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-history-incremental-pattern-search-forward $@
}
_zsh_autosuggest_bound_1_history-incremental-search-backward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-history-incremental-search-backward $@
}
_zsh_autosuggest_bound_1_history-incremental-search-forward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-history-incremental-search-forward $@
}
_zsh_autosuggest_bound_1_history-search-backward () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-history-search-backward $@
}
_zsh_autosuggest_bound_1_history-search-forward () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-history-search-forward $@
}
_zsh_autosuggest_bound_1_infer-next-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-infer-next-history $@
}
_zsh_autosuggest_bound_1_insert-last-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-insert-last-word $@
}
_zsh_autosuggest_bound_1_kill-buffer () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-buffer $@
}
_zsh_autosuggest_bound_1_kill-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-line $@
}
_zsh_autosuggest_bound_1_kill-region () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-region $@
}
_zsh_autosuggest_bound_1_kill-whole-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-whole-line $@
}
_zsh_autosuggest_bound_1_kill-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-word $@
}
_zsh_autosuggest_bound_1_lewd () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-lewd $@
}
_zsh_autosuggest_bound_1_list-choices () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-list-choices $@
}
_zsh_autosuggest_bound_1_list-expand () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-list-expand $@
}
_zsh_autosuggest_bound_1_lrock () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-lrock $@
}
_zsh_autosuggest_bound_1_luap () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-luap $@
}
_zsh_autosuggest_bound_1_magic-space () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-magic-space $@
}
_zsh_autosuggest_bound_1_menu-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-menu-complete $@
}
_zsh_autosuggest_bound_1_menu-expand-or-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-menu-expand-or-complete $@
}
_zsh_autosuggest_bound_1_neg-argument () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-neg-argument $@
}
_zsh_autosuggest_bound_1_overwrite-mode () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-overwrite-mode $@
}
_zsh_autosuggest_bound_1_plug () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-plug $@
}
_zsh_autosuggest_bound_1_pound-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-pound-insert $@
}
_zsh_autosuggest_bound_1_program () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-program $@
}
_zsh_autosuggest_bound_1_push-input () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-push-input $@
}
_zsh_autosuggest_bound_1_push-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-push-line $@
}
_zsh_autosuggest_bound_1_push-line-or-edit () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-push-line-or-edit $@
}
_zsh_autosuggest_bound_1_put-replace-selection () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-put-replace-selection $@
}
_zsh_autosuggest_bound_1_quote-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-quote-line $@
}
_zsh_autosuggest_bound_1_quote-region () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-quote-region $@
}
_zsh_autosuggest_bound_1_quoted-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-quoted-insert $@
}
_zsh_autosuggest_bound_1_read-command () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-read-command $@
}
_zsh_autosuggest_bound_1_recursive-edit () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-recursive-edit $@
}
_zsh_autosuggest_bound_1_redisplay () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-redisplay $@
}
_zsh_autosuggest_bound_1_redo () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-redo $@
}
_zsh_autosuggest_bound_1_reset-prompt () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-reset-prompt $@
}
_zsh_autosuggest_bound_1_reverse-menu-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-reverse-menu-complete $@
}
_zsh_autosuggest_bound_1_select-a-blank-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-a-blank-word $@
}
_zsh_autosuggest_bound_1_select-a-shell-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-a-shell-word $@
}
_zsh_autosuggest_bound_1_select-a-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-a-word $@
}
_zsh_autosuggest_bound_1_select-in-blank-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-in-blank-word $@
}
_zsh_autosuggest_bound_1_select-in-shell-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-in-shell-word $@
}
_zsh_autosuggest_bound_1_select-in-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-in-word $@
}
_zsh_autosuggest_bound_1_self-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-self-insert $@
}
_zsh_autosuggest_bound_1_self-insert-unmeta () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-self-insert-unmeta $@
}
_zsh_autosuggest_bound_1_send-break () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-send-break $@
}
_zsh_autosuggest_bound_1_set-mark-command () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-set-mark-command $@
}
_zsh_autosuggest_bound_1_spell () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-spell $@
}
_zsh_autosuggest_bound_1_spell-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-spell-word $@
}
_zsh_autosuggest_bound_1_split-undo () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-split-undo $@
}
_zsh_autosuggest_bound_1_transpose-chars () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-transpose-chars $@
}
_zsh_autosuggest_bound_1_transpose-words () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-transpose-words $@
}
_zsh_autosuggest_bound_1_undefined-key () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-undefined-key $@
}
_zsh_autosuggest_bound_1_undo () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-undo $@
}
_zsh_autosuggest_bound_1_universal-argument () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-universal-argument $@
}
_zsh_autosuggest_bound_1_up-case-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-up-case-word $@
}
_zsh_autosuggest_bound_1_up-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-up-history $@
}
_zsh_autosuggest_bound_1_up-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-up-line $@
}
_zsh_autosuggest_bound_1_up-line-or-history () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-up-line-or-history $@
}
_zsh_autosuggest_bound_1_up-line-or-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-up-line-or-search $@
}
_zsh_autosuggest_bound_1_vconf () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vconf $@
}
_zsh_autosuggest_bound_1_vi-add-eol () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-vi-add-eol $@
}
_zsh_autosuggest_bound_1_vi-add-next () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-add-next $@
}
_zsh_autosuggest_bound_1_vi-backward-blank-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-blank-word $@
}
_zsh_autosuggest_bound_1_vi-backward-blank-word-end () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-blank-word-end $@
}
_zsh_autosuggest_bound_1_vi-backward-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-char $@
}
_zsh_autosuggest_bound_1_vi-backward-delete-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-delete-char $@
}
_zsh_autosuggest_bound_1_vi-backward-kill-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-kill-word $@
}
_zsh_autosuggest_bound_1_vi-backward-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-word $@
}
_zsh_autosuggest_bound_1_vi-backward-word-end () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-word-end $@
}
_zsh_autosuggest_bound_1_vi-beginning-of-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-beginning-of-line $@
}
_zsh_autosuggest_bound_1_vi-caps-lock-panic () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-caps-lock-panic $@
}
_zsh_autosuggest_bound_1_vi-change () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-change $@
}
_zsh_autosuggest_bound_1_vi-change-eol () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-change-eol $@
}
_zsh_autosuggest_bound_1_vi-change-whole-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-change-whole-line $@
}
_zsh_autosuggest_bound_1_vi-cmd-mode () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-cmd-mode $@
}
_zsh_autosuggest_bound_1_vi-delete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-delete $@
}
_zsh_autosuggest_bound_1_vi-delete-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-delete-char $@
}
_zsh_autosuggest_bound_1_vi-digit-or-beginning-of-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-digit-or-beginning-of-line $@
}
_zsh_autosuggest_bound_1_vi-down-case () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-down-case $@
}
_zsh_autosuggest_bound_1_vi-down-line-or-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-down-line-or-history $@
}
_zsh_autosuggest_bound_1_vi-end-of-line () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-vi-end-of-line $@
}
_zsh_autosuggest_bound_1_vi-fetch-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-fetch-history $@
}
_zsh_autosuggest_bound_1_vi-find-next-char () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-find-next-char $@
}
_zsh_autosuggest_bound_1_vi-find-next-char-skip () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-find-next-char-skip $@
}
_zsh_autosuggest_bound_1_vi-find-prev-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-find-prev-char $@
}
_zsh_autosuggest_bound_1_vi-find-prev-char-skip () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-find-prev-char-skip $@
}
_zsh_autosuggest_bound_1_vi-first-non-blank () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-first-non-blank $@
}
_zsh_autosuggest_bound_1_vi-forward-blank-word () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-forward-blank-word $@
}
_zsh_autosuggest_bound_1_vi-forward-blank-word-end () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-forward-blank-word-end $@
}
_zsh_autosuggest_bound_1_vi-forward-char () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-vi-forward-char $@
}
_zsh_autosuggest_bound_1_vi-forward-word () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-forward-word $@
}
_zsh_autosuggest_bound_1_vi-forward-word-end () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-forward-word-end $@
}
_zsh_autosuggest_bound_1_vi-goto-column () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-goto-column $@
}
_zsh_autosuggest_bound_1_vi-goto-mark () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-goto-mark $@
}
_zsh_autosuggest_bound_1_vi-goto-mark-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-goto-mark-line $@
}
_zsh_autosuggest_bound_1_vi-history-search-backward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-history-search-backward $@
}
_zsh_autosuggest_bound_1_vi-history-search-forward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-history-search-forward $@
}
_zsh_autosuggest_bound_1_vi-indent () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-indent $@
}
_zsh_autosuggest_bound_1_vi-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-insert $@
}
_zsh_autosuggest_bound_1_vi-insert-bol () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-insert-bol $@
}
_zsh_autosuggest_bound_1_vi-join () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-join $@
}
_zsh_autosuggest_bound_1_vi-kill-eol () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-kill-eol $@
}
_zsh_autosuggest_bound_1_vi-kill-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-kill-line $@
}
_zsh_autosuggest_bound_1_vi-match-bracket () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-match-bracket $@
}
_zsh_autosuggest_bound_1_vi-open-line-above () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-open-line-above $@
}
_zsh_autosuggest_bound_1_vi-open-line-below () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-open-line-below $@
}
_zsh_autosuggest_bound_1_vi-oper-swap-case () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-oper-swap-case $@
}
_zsh_autosuggest_bound_1_vi-pound-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-pound-insert $@
}
_zsh_autosuggest_bound_1_vi-put-after () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-put-after $@
}
_zsh_autosuggest_bound_1_vi-put-before () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-put-before $@
}
_zsh_autosuggest_bound_1_vi-quoted-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-quoted-insert $@
}
_zsh_autosuggest_bound_1_vi-repeat-change () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-repeat-change $@
}
_zsh_autosuggest_bound_1_vi-repeat-find () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-repeat-find $@
}
_zsh_autosuggest_bound_1_vi-repeat-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-repeat-search $@
}
_zsh_autosuggest_bound_1_vi-replace () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-replace $@
}
_zsh_autosuggest_bound_1_vi-replace-chars () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-replace-chars $@
}
_zsh_autosuggest_bound_1_vi-rev-repeat-find () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-rev-repeat-find $@
}
_zsh_autosuggest_bound_1_vi-rev-repeat-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-rev-repeat-search $@
}
_zsh_autosuggest_bound_1_vi-set-buffer () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-set-buffer $@
}
_zsh_autosuggest_bound_1_vi-set-mark () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-set-mark $@
}
_zsh_autosuggest_bound_1_vi-substitute () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-substitute $@
}
_zsh_autosuggest_bound_1_vi-swap-case () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-swap-case $@
}
_zsh_autosuggest_bound_1_vi-undo-change () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-undo-change $@
}
_zsh_autosuggest_bound_1_vi-unindent () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-unindent $@
}
_zsh_autosuggest_bound_1_vi-up-case () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-up-case $@
}
_zsh_autosuggest_bound_1_vi-up-line-or-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-up-line-or-history $@
}
_zsh_autosuggest_bound_1_vi-yank () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-yank $@
}
_zsh_autosuggest_bound_1_vi-yank-eol () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-yank-eol $@
}
_zsh_autosuggest_bound_1_vi-yank-whole-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-yank-whole-line $@
}
_zsh_autosuggest_bound_1_visual-line-mode () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-visual-line-mode $@
}
_zsh_autosuggest_bound_1_visual-mode () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-visual-mode $@
}
_zsh_autosuggest_bound_1_what-cursor-position () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-what-cursor-position $@
}
_zsh_autosuggest_bound_1_where-is () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-where-is $@
}
_zsh_autosuggest_bound_1_zconf () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-zconf $@
}
_zsh_autosuggest_capture_completion_async () {
	_zsh_autosuggest_capture_setup
	zmodload zsh/parameter 2> /dev/null || return
	autoload +X _complete
	functions[_original_complete]=$functions[_complete] 
	_complete () {
		unset 'compstate[vared]'
		_original_complete "$@"
	}
	vared 1
}
_zsh_autosuggest_capture_completion_sync () {
	_zsh_autosuggest_capture_setup
	zle autosuggest-capture-completion
}
_zsh_autosuggest_capture_completion_widget () {
	local -a +h comppostfuncs
	comppostfuncs=(_zsh_autosuggest_capture_postcompletion) 
	CURSOR=$#BUFFER 
	zle -- ${(k)widgets[(r)completion:.complete-word:_main_complete]}
	if is-at-least 5.0.3
	then
		stty -onlcr -ocrnl -F /dev/tty
	fi
	echo -nE - $'\0'$BUFFER$'\0'
}
_zsh_autosuggest_capture_postcompletion () {
	compstate[insert]=1 
	unset 'compstate[list]'
}
_zsh_autosuggest_capture_setup () {
	if ! is-at-least 5.4
	then
		zshexit () {
			kill -KILL $$ 2>&- || command kill -KILL $$
			sleep 1
		}
	fi
	zstyle ':completion:*' matcher-list ''
	zstyle ':completion:*' path-completion false
	zstyle ':completion:*' max-errors 0 not-numeric
	bindkey '^I' autosuggest-capture-completion
}
_zsh_autosuggest_clear () {
	unset POSTDISPLAY
	_zsh_autosuggest_invoke_original_widget $@
}
_zsh_autosuggest_disable () {
	typeset -g _ZSH_AUTOSUGGEST_DISABLED
	_zsh_autosuggest_clear
}
_zsh_autosuggest_enable () {
	unset _ZSH_AUTOSUGGEST_DISABLED
	if (( $#BUFFER ))
	then
		_zsh_autosuggest_fetch
	fi
}
_zsh_autosuggest_escape_command () {
	setopt localoptions EXTENDED_GLOB
	echo -E "${1//(#m)[\"\'\\()\[\]|*?~]/\\$MATCH}"
}
_zsh_autosuggest_execute () {
	BUFFER="$BUFFER$POSTDISPLAY" 
	unset POSTDISPLAY
	_zsh_autosuggest_invoke_original_widget "accept-line"
}
_zsh_autosuggest_fetch () {
	if (( ${+ZSH_AUTOSUGGEST_USE_ASYNC} ))
	then
		_zsh_autosuggest_async_request "$BUFFER"
	else
		local suggestion
		_zsh_autosuggest_fetch_suggestion "$BUFFER"
		_zsh_autosuggest_suggest "$suggestion"
	fi
}
_zsh_autosuggest_fetch_suggestion () {
	typeset -g suggestion
	local -a strategies
	local strategy
	strategies=(${=ZSH_AUTOSUGGEST_STRATEGY}) 
	for strategy in $strategies
	do
		_zsh_autosuggest_strategy_$strategy "$1"
		[[ "$suggestion" != "$1"* ]] && unset suggestion
		[[ -n "$suggestion" ]] && break
	done
}
_zsh_autosuggest_highlight_apply () {
	typeset -g _ZSH_AUTOSUGGEST_LAST_HIGHLIGHT
	if (( $#POSTDISPLAY ))
	then
		typeset -g _ZSH_AUTOSUGGEST_LAST_HIGHLIGHT="$#BUFFER $(($#BUFFER + $#POSTDISPLAY)) $ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE" 
		region_highlight+=("$_ZSH_AUTOSUGGEST_LAST_HIGHLIGHT") 
	else
		unset _ZSH_AUTOSUGGEST_LAST_HIGHLIGHT
	fi
}
_zsh_autosuggest_highlight_reset () {
	typeset -g _ZSH_AUTOSUGGEST_LAST_HIGHLIGHT
	if [[ -n "$_ZSH_AUTOSUGGEST_LAST_HIGHLIGHT" ]]
	then
		region_highlight=("${(@)region_highlight:#$_ZSH_AUTOSUGGEST_LAST_HIGHLIGHT}") 
		unset _ZSH_AUTOSUGGEST_LAST_HIGHLIGHT
	fi
}
_zsh_autosuggest_incr_bind_count () {
	typeset -gi bind_count=$((_ZSH_AUTOSUGGEST_BIND_COUNTS[$1]+1)) 
	_ZSH_AUTOSUGGEST_BIND_COUNTS[$1]=$bind_count 
}
_zsh_autosuggest_invoke_original_widget () {
	(( $# )) || return 0
	local original_widget_name="$1" 
	shift
	if (( ${+widgets[$original_widget_name]} ))
	then
		zle $original_widget_name -- $@
	fi
}
_zsh_autosuggest_modify () {
	local -i retval
	local -i KEYS_QUEUED_COUNT
	local orig_buffer="$BUFFER" 
	local orig_postdisplay="$POSTDISPLAY" 
	unset POSTDISPLAY
	_zsh_autosuggest_invoke_original_widget $@
	retval=$? 
	emulate -L zsh
	if (( $PENDING > 0 || $KEYS_QUEUED_COUNT > 0 ))
	then
		POSTDISPLAY="$orig_postdisplay" 
		return $retval
	fi
	if [[ "$BUFFER" = "$orig_buffer"* && "$orig_postdisplay" = "${BUFFER:$#orig_buffer}"* ]]
	then
		POSTDISPLAY="${orig_postdisplay:$(($#BUFFER - $#orig_buffer))}" 
		return $retval
	fi
	if (( ${+_ZSH_AUTOSUGGEST_DISABLED} ))
	then
		return $?
	fi
	if (( $#BUFFER > 0 ))
	then
		if [[ -z "$ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE" ]] || (( $#BUFFER <= $ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE ))
		then
			_zsh_autosuggest_fetch
		fi
	fi
	return $retval
}
_zsh_autosuggest_partial_accept () {
	local -i retval cursor_loc
	local original_buffer="$BUFFER" 
	BUFFER="$BUFFER$POSTDISPLAY" 
	_zsh_autosuggest_invoke_original_widget $@
	retval=$? 
	cursor_loc=$CURSOR 
	if [[ "$KEYMAP" = "vicmd" ]]
	then
		cursor_loc=$((cursor_loc + 1)) 
	fi
	if (( $cursor_loc > $#original_buffer ))
	then
		POSTDISPLAY="${BUFFER[$(($cursor_loc + 1)),$#BUFFER]}" 
		BUFFER="${BUFFER[1,$cursor_loc]}" 
	else
		BUFFER="$original_buffer" 
	fi
	return $retval
}
_zsh_autosuggest_start () {
	if (( ${+ZSH_AUTOSUGGEST_MANUAL_REBIND} ))
	then
		add-zsh-hook -d precmd _zsh_autosuggest_start
	fi
	_zsh_autosuggest_bind_widgets
}
_zsh_autosuggest_strategy_completion () {
	emulate -L zsh
	setopt EXTENDED_GLOB
	typeset -g suggestion
	local line REPLY
	whence compdef > /dev/null || return
	zmodload zsh/zpty 2> /dev/null || return
	[[ -n "$ZSH_AUTOSUGGEST_COMPLETION_IGNORE" ]] && [[ "$1" == $~ZSH_AUTOSUGGEST_COMPLETION_IGNORE ]] && return
	if zle
	then
		zpty $ZSH_AUTOSUGGEST_COMPLETIONS_PTY_NAME _zsh_autosuggest_capture_completion_sync
	else
		zpty $ZSH_AUTOSUGGEST_COMPLETIONS_PTY_NAME _zsh_autosuggest_capture_completion_async "\$1"
		zpty -w $ZSH_AUTOSUGGEST_COMPLETIONS_PTY_NAME $'\t'
	fi
	{
		zpty -r $ZSH_AUTOSUGGEST_COMPLETIONS_PTY_NAME line '*'$'\0''*'$'\0'
		suggestion="${${(@0)line}[2]}" 
	} always {
		zpty -d $ZSH_AUTOSUGGEST_COMPLETIONS_PTY_NAME
	}
}
_zsh_autosuggest_strategy_history () {
	emulate -L zsh
	setopt EXTENDED_GLOB
	local prefix="${1//(#m)[\\*?[\]<>()|^~#]/\\$MATCH}" 
	local pattern="$prefix*" 
	if [[ -n $ZSH_AUTOSUGGEST_HISTORY_IGNORE ]]
	then
		pattern="($pattern)~($ZSH_AUTOSUGGEST_HISTORY_IGNORE)" 
	fi
	typeset -g suggestion="${history[(r)$pattern]}" 
}
_zsh_autosuggest_strategy_match_prev_cmd () {
	emulate -L zsh
	setopt EXTENDED_GLOB
	local prefix="${1//(#m)[\\*?[\]<>()|^~#]/\\$MATCH}" 
	local pattern="$prefix*" 
	if [[ -n $ZSH_AUTOSUGGEST_HISTORY_IGNORE ]]
	then
		pattern="($pattern)~($ZSH_AUTOSUGGEST_HISTORY_IGNORE)" 
	fi
	local history_match_keys
	history_match_keys=(${(k)history[(R)$~pattern]}) 
	local histkey="${history_match_keys[1]}" 
	local prev_cmd="$(_zsh_autosuggest_escape_command "${history[$((HISTCMD-1))]}")" 
	for key in "${(@)history_match_keys[1,200]}"
	do
		[[ $key -gt 1 ]] || break
		if [[ "${history[$((key - 1))]}" == "$prev_cmd" ]]
		then
			histkey="$key" 
			break
		fi
	done
	typeset -g suggestion="$history[$histkey]" 
}
_zsh_autosuggest_suggest () {
	emulate -L zsh
	local suggestion="$1" 
	if [[ -n "$suggestion" ]] && (( $#BUFFER ))
	then
		POSTDISPLAY="${suggestion#$BUFFER}" 
	else
		unset POSTDISPLAY
	fi
}
_zsh_autosuggest_toggle () {
	if (( ${+_ZSH_AUTOSUGGEST_DISABLED} ))
	then
		_zsh_autosuggest_enable
	else
		_zsh_autosuggest_disable
	fi
}
_zsh_autosuggest_widget_accept () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_accept $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_clear () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_clear $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_disable () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_disable $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_enable () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_enable $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_execute () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_execute $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_fetch () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_fetch $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_modify () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_modify $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_partial_accept () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_partial_accept $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_suggest () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_suggest $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_autosuggest_widget_toggle () {
	local -i retval
	_zsh_autosuggest_highlight_reset
	_zsh_autosuggest_toggle $@
	retval=$? 
	_zsh_autosuggest_highlight_apply
	zle -R
	return $retval
}
_zsh_highlight () {
	local ret=$? 
	if [[ $WIDGET == zle-isearch-update ]] && {
			$zsh_highlight__pat_static_bug || ! (( $+ISEARCHMATCH_ACTIVE ))
		}
	then
		region_highlight=() 
		return $ret
	fi
	local -A zsyh_user_options
	if zmodload -e zsh/parameter
	then
		zsyh_user_options=("${(@kv)options}") 
	else
		local canonical_options onoff option raw_options
		raw_options=(${(f)"$(emulate -R zsh; set -o)"}) 
		canonical_options=(${${${(M)raw_options:#*off}%% *}#no} ${${(M)raw_options:#*on}%% *}) 
		for option in $canonical_options
		do
			[[ -o $option ]]
			onoff=${${=:-off on}[2-$?]} 
			zsyh_user_options+=($option $onoff) 
		done
	fi
	typeset -r zsyh_user_options
	emulate -L zsh
	setopt localoptions warncreateglobal nobashrematch
	local REPLY
	[[ -n ${ZSH_HIGHLIGHT_MAXLENGTH:-} ]] && [[ $#BUFFER -gt $ZSH_HIGHLIGHT_MAXLENGTH ]] && return $ret
	[[ $PENDING -gt 0 ]] && return $ret
	typeset -ga region_highlight
	region_highlight=() 
	{
		local cache_place
		local -a region_highlight_copy
		local highlighter
		for highlighter in $ZSH_HIGHLIGHT_HIGHLIGHTERS
		do
			cache_place="_zsh_highlight__highlighter_${highlighter}_cache" 
			typeset -ga ${cache_place}
			if ! type "_zsh_highlight_highlighter_${highlighter}_predicate" >&/dev/null
			then
				echo "zsh-syntax-highlighting: warning: disabling the ${(qq)highlighter} highlighter as it has not been loaded" >&2
				ZSH_HIGHLIGHT_HIGHLIGHTERS=(${ZSH_HIGHLIGHT_HIGHLIGHTERS:#${highlighter}}) 
			elif "_zsh_highlight_highlighter_${highlighter}_predicate"
			then
				region_highlight_copy=("${region_highlight[@]}") 
				region_highlight=() 
				{
					"_zsh_highlight_highlighter_${highlighter}_paint"
				} always {
					: ${(AP)cache_place::="${region_highlight[@]}"}
				}
				region_highlight=("${region_highlight_copy[@]}") 
			fi
			region_highlight+=("${(@P)cache_place}") 
		done
		() {
			(( REGION_ACTIVE )) || return
			integer min max
			if (( MARK > CURSOR ))
			then
				min=$CURSOR max=$MARK 
			else
				min=$MARK max=$CURSOR 
			fi
			if (( REGION_ACTIVE == 1 ))
			then
				[[ $KEYMAP = vicmd ]] && (( max++ ))
			elif (( REGION_ACTIVE == 2 ))
			then
				local needle=$'\n' 
				(( min = ${BUFFER[(Ib:min:)$needle]} ))
				(( max = ${BUFFER[(ib:max:)$needle]} - 1 ))
			fi
			_zsh_highlight_apply_zle_highlight region standout "$min" "$max"
		}
		(( $+YANK_ACTIVE )) && (( YANK_ACTIVE )) && _zsh_highlight_apply_zle_highlight paste standout "$YANK_START" "$YANK_END"
		(( $+ISEARCHMATCH_ACTIVE )) && (( ISEARCHMATCH_ACTIVE )) && _zsh_highlight_apply_zle_highlight isearch underline "$ISEARCHMATCH_START" "$ISEARCHMATCH_END"
		(( $+SUFFIX_ACTIVE )) && (( SUFFIX_ACTIVE )) && _zsh_highlight_apply_zle_highlight suffix bold "$SUFFIX_START" "$SUFFIX_END"
		return $ret
	} always {
		typeset -g _ZSH_HIGHLIGHT_PRIOR_BUFFER="$BUFFER" 
		typeset -gi _ZSH_HIGHLIGHT_PRIOR_CURSOR=$CURSOR 
	}
}
_zsh_highlight_add_highlight () {
	local -i start end
	local highlight
	start=$1 
	end=$2 
	shift 2
	for highlight
	do
		if (( $+ZSH_HIGHLIGHT_STYLES[$highlight] ))
		then
			region_highlight+=("$start $end $ZSH_HIGHLIGHT_STYLES[$highlight]") 
			break
		fi
	done
}
_zsh_highlight_apply_zle_highlight () {
	local entry="$1" default="$2" 
	integer first="$3" second="$4" 
	local region="${zle_highlight[(r)${entry}:*]-}" 
	if [[ -z "$region" ]]
	then
		region=$default 
	else
		region="${region#${entry}:}" 
		if [[ -z "$region" ]] || [[ "$region" == none ]]
		then
			return
		fi
	fi
	integer start end
	if (( first < second ))
	then
		start=$first end=$second 
	else
		start=$second end=$first 
	fi
	region_highlight+=("$start $end $region") 
}
_zsh_highlight_bind_widgets () {
	setopt localoptions noksharrays
	typeset -F SECONDS
	local prefix=orig-s$SECONDS-r$RANDOM 
	zmodload zsh/zleparameter 2> /dev/null || {
		print -r -- 'zsh-syntax-highlighting: failed loading zsh/zleparameter.' >&2
		return 1
	}
	local -U widgets_to_bind
	widgets_to_bind=(${${(k)widgets}:#(.*|run-help|which-command|beep|set-local-history|yank|yank-pop)}) 
	widgets_to_bind+=(zle-line-finish) 
	widgets_to_bind+=(zle-isearch-update) 
	local cur_widget
	for cur_widget in $widgets_to_bind
	do
		case ${widgets[$cur_widget]:-""} in
			(user:_zsh_highlight_widget_*)  ;;
			(user:*) zle -N $prefix-$cur_widget ${widgets[$cur_widget]#*:}
				eval "_zsh_highlight_widget_${(q)prefix}-${(q)cur_widget}() { _zsh_highlight_call_widget ${(q)prefix}-${(q)cur_widget} -- \"\$@\" }"
				zle -N $cur_widget _zsh_highlight_widget_$prefix-$cur_widget ;;
			(completion:*) zle -C $prefix-$cur_widget ${${(s.:.)widgets[$cur_widget]}[2,3]}
				eval "_zsh_highlight_widget_${(q)prefix}-${(q)cur_widget}() { _zsh_highlight_call_widget ${(q)prefix}-${(q)cur_widget} -- \"\$@\" }"
				zle -N $cur_widget _zsh_highlight_widget_$prefix-$cur_widget ;;
			(builtin) eval "_zsh_highlight_widget_${(q)prefix}-${(q)cur_widget}() { _zsh_highlight_call_widget .${(q)cur_widget} -- \"\$@\" }"
				zle -N $cur_widget _zsh_highlight_widget_$prefix-$cur_widget ;;
			(*) if [[ $cur_widget == zle-* ]] && (( ! ${+widgets[$cur_widget]} ))
				then
					_zsh_highlight_widget_${cur_widget} () {
						:
						_zsh_highlight
					}
					zle -N $cur_widget _zsh_highlight_widget_$cur_widget
				else
					print -r -- "zsh-syntax-highlighting: unhandled ZLE widget ${(qq)cur_widget}" >&2
					print -r -- "zsh-syntax-highlighting: (This is sometimes caused by doing \`bindkey <keys> ${(q-)cur_widget}\` without creating the ${(qq)cur_widget} widget with \`zle -N\` or \`zle -C\`.)" >&2
				fi ;;
		esac
	done
}
_zsh_highlight_brackets_match () {
	case $BUFFER[$1] in
		(\() [[ $BUFFER[$2] == \) ]] ;;
		(\[) [[ $BUFFER[$2] == \] ]] ;;
		(\{) [[ $BUFFER[$2] == \} ]] ;;
		(*) false ;;
	esac
}
_zsh_highlight_buffer_modified () {
	[[ "${_ZSH_HIGHLIGHT_PRIOR_BUFFER:-}" != "$BUFFER" ]]
}
_zsh_highlight_call_widget () {
	builtin zle "$@" && _zsh_highlight
}
_zsh_highlight_cursor_moved () {
	[[ -n $CURSOR ]] && [[ -n ${_ZSH_HIGHLIGHT_PRIOR_CURSOR-} ]] && (($_ZSH_HIGHLIGHT_PRIOR_CURSOR != $CURSOR))
}
_zsh_highlight_highlighter_brackets_paint () {
	local char style
	local -i bracket_color_size=${#ZSH_HIGHLIGHT_STYLES[(I)bracket-level-*]} buflen=${#BUFFER} level=0 matchingpos pos 
	local -A levelpos lastoflevel matching
	for ((pos = 1; pos <= buflen; pos++ )) do
		char=$BUFFER[pos] 
		case $char in
			(["([{"]) levelpos[$pos]=$((++level)) 
				lastoflevel[$level]=$pos  ;;
			([")]}"]) if (( level > 0 ))
				then
					matchingpos=$lastoflevel[$level] 
					levelpos[$pos]=$((level--)) 
					if _zsh_highlight_brackets_match $matchingpos $pos
					then
						matching[$matchingpos]=$pos 
						matching[$pos]=$matchingpos 
					fi
				else
					levelpos[$pos]=-1 
				fi ;;
		esac
	done
	for pos in ${(k)levelpos}
	do
		if (( $+matching[$pos] ))
		then
			if (( bracket_color_size ))
			then
				_zsh_highlight_add_highlight $((pos - 1)) $pos bracket-level-$(( (levelpos[$pos] - 1) % bracket_color_size + 1 ))
			fi
		else
			_zsh_highlight_add_highlight $((pos - 1)) $pos bracket-error
		fi
	done
	if [[ $WIDGET != zle-line-finish ]]
	then
		pos=$((CURSOR + 1)) 
		if (( $+levelpos[$pos] )) && (( $+matching[$pos] ))
		then
			local -i otherpos=$matching[$pos] 
			_zsh_highlight_add_highlight $((otherpos - 1)) $otherpos cursor-matchingbracket
		fi
	fi
}
_zsh_highlight_highlighter_brackets_predicate () {
	[[ $WIDGET == zle-line-finish ]] || _zsh_highlight_cursor_moved || _zsh_highlight_buffer_modified
}
_zsh_highlight_highlighter_cursor_paint () {
	[[ $WIDGET == zle-line-finish ]] && return
	_zsh_highlight_add_highlight $CURSOR $(( $CURSOR + 1 )) cursor
}
_zsh_highlight_highlighter_cursor_predicate () {
	[[ $WIDGET == zle-line-finish ]] || _zsh_highlight_cursor_moved
}
_zsh_highlight_highlighter_line_paint () {
	_zsh_highlight_add_highlight 0 $#BUFFER line
}
_zsh_highlight_highlighter_line_predicate () {
	_zsh_highlight_buffer_modified
}
_zsh_highlight_highlighter_main_paint () {
	setopt localoptions extendedglob
	if [[ $CONTEXT == (select|vared) ]]
	then
		return
	fi
	typeset -a ZSH_HIGHLIGHT_TOKENS_COMMANDSEPARATOR
	typeset -a ZSH_HIGHLIGHT_TOKENS_CONTROL_FLOW
	local -a options_to_set reply
	local REPLY
	local flags_with_argument
	local flags_sans_argument
	local -A precommand_options
	precommand_options=('-' '' 'builtin' '' 'command' :pvV 'exec' a:cl 'noglob' '' 'doas' aCu:Lns 'nice' n: 'pkexec' '' 'sudo' Cgprtu:AEHPSbilns 'stdbuf' ioe: 'eatmydata' '' 'catchsegv' '' 'nohup' '' 'setsid' :wc 'ssh-agent' aEPt:csDd 'tabbed' gnprtTuU:cdfhs 'chronic' :ev 'ifne' :n) 
	if [[ $zsyh_user_options[ignorebraces] == on || ${zsyh_user_options[ignoreclosebraces]:-off} == on ]]
	then
		local right_brace_is_recognised_everywhere=false 
	else
		local right_brace_is_recognised_everywhere=true 
	fi
	if [[ $zsyh_user_options[pathdirs] == on ]]
	then
		options_to_set+=(PATH_DIRS) 
	fi
	ZSH_HIGHLIGHT_TOKENS_COMMANDSEPARATOR=('|' '||' ';' '&' '&&' '|&' '&!' '&|') 
	ZSH_HIGHLIGHT_TOKENS_CONTROL_FLOW=($'\x7b' $'\x28' '()' 'while' 'until' 'if' 'then' 'elif' 'else' 'do' 'time' 'coproc' '!') 
	if (( $+X_ZSH_HIGHLIGHT_DIRS_BLACKLIST ))
	then
		print 'zsh-syntax-highlighting: X_ZSH_HIGHLIGHT_DIRS_BLACKLIST is deprecated. Please use ZSH_HIGHLIGHT_DIRS_BLACKLIST.' >&2
		ZSH_HIGHLIGHT_DIRS_BLACKLIST=($X_ZSH_HIGHLIGHT_DIRS_BLACKLIST) 
		unset X_ZSH_HIGHLIGHT_DIRS_BLACKLIST
	fi
	_zsh_highlight_main_highlighter_highlight_list -$#PREBUFFER '' 1 "$PREBUFFER$BUFFER"
	local start end_ style
	for start end_ style in $reply
	do
		(( start >= end_ )) && {
			print -r -- "zsh-syntax-highlighting: BUG: _zsh_highlight_highlighter_main_paint: start($start) >= end($end_)" >&2
			return
		}
		(( end_ <= 0 )) && continue
		(( start < 0 )) && start=0 
		_zsh_highlight_main_calculate_fallback $style
		_zsh_highlight_add_highlight $start $end_ $reply
	done
}
_zsh_highlight_highlighter_main_predicate () {
	[[ $WIDGET == zle-line-finish ]] || _zsh_highlight_buffer_modified
}
_zsh_highlight_highlighter_pattern_paint () {
	setopt localoptions extendedglob
	local pattern
	for pattern in ${(k)ZSH_HIGHLIGHT_PATTERNS}
	do
		_zsh_highlight_pattern_highlighter_loop "$BUFFER" "$pattern"
	done
}
_zsh_highlight_highlighter_pattern_predicate () {
	_zsh_highlight_buffer_modified
}
_zsh_highlight_highlighter_regexp_paint () {
	setopt localoptions extendedglob
	local pattern
	for pattern in ${(k)ZSH_HIGHLIGHT_REGEXP}
	do
		_zsh_highlight_regexp_highlighter_loop "$BUFFER" "$pattern"
	done
}
_zsh_highlight_highlighter_regexp_predicate () {
	_zsh_highlight_buffer_modified
}
_zsh_highlight_highlighter_root_paint () {
	if (( EUID == 0 ))
	then
		_zsh_highlight_add_highlight 0 $#BUFFER root
	fi
}
_zsh_highlight_highlighter_root_predicate () {
	_zsh_highlight_buffer_modified
}
_zsh_highlight_load_highlighters () {
	setopt localoptions noksharrays bareglobqual
	[[ -d "$1" ]] || {
		print -r -- "zsh-syntax-highlighting: highlighters directory ${(qq)1} not found." >&2
		return 1
	}
	local highlighter highlighter_dir
	for highlighter_dir in $1/*/(/)
	do
		highlighter="${highlighter_dir:t}" 
		[[ -f "$highlighter_dir${highlighter}-highlighter.zsh" ]] && . "$highlighter_dir${highlighter}-highlighter.zsh"
		if type "_zsh_highlight_highlighter_${highlighter}_paint" &> /dev/null && type "_zsh_highlight_highlighter_${highlighter}_predicate" &> /dev/null
		then
			
		elif type "_zsh_highlight_${highlighter}_highlighter" &> /dev/null && type "_zsh_highlight_${highlighter}_highlighter_predicate" &> /dev/null
		then
			if false
			then
				print -r -- "zsh-syntax-highlighting: warning: ${(qq)highlighter} highlighter uses deprecated entry point names; please ask its maintainer to update it: https://github.com/zsh-users/zsh-syntax-highlighting/issues/329" >&2
			fi
			eval "_zsh_highlight_highlighter_${(q)highlighter}_paint() { _zsh_highlight_${(q)highlighter}_highlighter \"\$@\" }"
			eval "_zsh_highlight_highlighter_${(q)highlighter}_predicate() { _zsh_highlight_${(q)highlighter}_highlighter_predicate \"\$@\" }"
		else
			print -r -- "zsh-syntax-highlighting: ${(qq)highlighter} highlighter should define both required functions '_zsh_highlight_highlighter_${highlighter}_paint' and '_zsh_highlight_highlighter_${highlighter}_predicate' in ${(qq):-"$highlighter_dir${highlighter}-highlighter.zsh"}." >&2
		fi
	done
}
_zsh_highlight_main__is_redirection () {
	[[ $1 == (<0-9>|)(\<|\>)* ]] && [[ $1 != (\<|\>)$'\x28'* ]] && [[ $1 != *'<'*'-'*'>'* ]]
}
_zsh_highlight_main__is_runnable () {
	if _zsh_highlight_main__type "$1"
	then
		[[ $REPLY != none ]]
	else
		return 2
	fi
}
_zsh_highlight_main__precmd_hook () {
	_zsh_highlight_main__command_type_cache=() 
}
_zsh_highlight_main__resolve_alias () {
	if zmodload -e zsh/parameter
	then
		REPLY=${aliases[$arg]} 
	else
		REPLY="${"$(alias -- $arg)"#*=}" 
	fi
}
_zsh_highlight_main__stack_pop () {
	if [[ $braces_stack[1] == $1 ]]
	then
		braces_stack=${braces_stack:1} 
		if (( $+2 ))
		then
			style=$2 
		fi
		return 0
	else
		style=unknown-token 
		return 1
	fi
}
_zsh_highlight_main__type () {
	integer -r aliases_allowed=${2-1} 
	integer may_cache=1 
	if (( $+_zsh_highlight_main__command_type_cache ))
	then
		REPLY=$_zsh_highlight_main__command_type_cache[(e)$1] 
		if [[ -n "$REPLY" ]]
		then
			return
		fi
	fi
	if (( $#options_to_set ))
	then
		setopt localoptions $options_to_set
	fi
	unset REPLY
	if zmodload -e zsh/parameter
	then
		if (( $+aliases[(e)$1] ))
		then
			may_cache=0 
		fi
		if (( $+aliases[(e)$1] )) && (( aliases_allowed ))
		then
			REPLY=alias 
		elif [[ $1 == *.* && -n ${1%.*} ]] && (( $+saliases[(e)${1##*.}] ))
		then
			REPLY='suffix alias' 
		elif (( $reswords[(Ie)$1] ))
		then
			REPLY=reserved 
		elif (( $+functions[(e)$1] ))
		then
			REPLY=function 
		elif (( $+builtins[(e)$1] ))
		then
			REPLY=builtin 
		elif (( $+commands[(e)$1] ))
		then
			REPLY=command 
		elif {
				[[ $1 != */* ]] || is-at-least 5.3
			} && ! (
				builtin type -w -- "$1"
			) > /dev/null 2>&1
		then
			REPLY=none 
		fi
	fi
	if ! (( $+REPLY ))
	then
		REPLY="${$(:; (( aliases_allowed )) || unalias -- "$1" 2>/dev/null; LC_ALL=C builtin type -w -- "$1" 2>/dev/null)##*: }" 
		if [[ $REPLY == 'alias' ]]
		then
			may_cache=0 
		fi
	fi
	if (( may_cache )) && (( $+_zsh_highlight_main__command_type_cache ))
	then
		_zsh_highlight_main__command_type_cache[(e)$1]=$REPLY 
	fi
	[[ -n $REPLY ]]
	return $?
}
_zsh_highlight_main_add_many_region_highlights () {
	for 1 2 3
	do
		_zsh_highlight_main_add_region_highlight $1 $2 $3
	done
}
_zsh_highlight_main_add_region_highlight () {
	integer start=$1 end=$2 
	shift 2
	if (( in_alias ))
	then
		[[ $1 == unknown-token ]] && alias_style=unknown-token 
		return
	fi
	if (( in_param ))
	then
		if [[ $1 == unknown-token ]]
		then
			param_style=unknown-token 
		fi
		if [[ -n $param_style ]]
		then
			return
		fi
		param_style=$1 
		return
	fi
	(( start += buf_offset ))
	(( end += buf_offset ))
	list_highlights+=($start $end $1) 
}
_zsh_highlight_main_calculate_fallback () {
	local -A fallback_of
	fallback_of=(alias arg0 suffix-alias arg0 builtin arg0 function arg0 command arg0 precommand arg0 hashed-command arg0 arg0_\* arg0 path_prefix path path_pathseparator path path_prefix_pathseparator path_prefix single-quoted-argument{-unclosed,} double-quoted-argument{-unclosed,} dollar-quoted-argument{-unclosed,} back-quoted-argument{-unclosed,} command-substitution{-quoted,,-unquoted,} command-substitution-delimiter{-quoted,,-unquoted,} command-substitution{-delimiter,} process-substitution{-delimiter,} back-quoted-argument{-delimiter,}) 
	local needle=$1 value 
	reply=($1) 
	while [[ -n ${value::=$fallback_of[(k)$needle]} ]]
	do
		unset "fallback_of[$needle]"
		reply+=($value) 
		needle=$value 
	done
}
_zsh_highlight_main_highlighter_check_assign () {
	setopt localoptions extended_glob
	[[ $arg == [[:alpha:]_][[:alnum:]_]#(|\[*\])(|[+])=* ]] || [[ $arg == [0-9]##(|[+])=* ]]
}
_zsh_highlight_main_highlighter_check_path () {
	_zsh_highlight_main_highlighter_expand_path "$1"
	local expanded_path="$REPLY" tmp_path 
	REPLY=path 
	[[ -z $expanded_path ]] && return 1
	if [[ $expanded_path[1] == / ]]
	then
		tmp_path=$expanded_path 
	else
		tmp_path=$PWD/$expanded_path 
	fi
	tmp_path=$tmp_path:a 
	while [[ $tmp_path != / ]]
	do
		[[ -n ${(M)ZSH_HIGHLIGHT_DIRS_BLACKLIST:#$tmp_path} ]] && return 1
		tmp_path=$tmp_path:h 
	done
	[[ -L $expanded_path ]] && return 0
	[[ -e $expanded_path ]] && return 0
	local cdpath_dir
	for cdpath_dir in $cdpath
	do
		[[ -e "$cdpath_dir/$expanded_path" ]] && return 0
	done
	[[ ! -d ${expanded_path:h} ]] && return 1
	if (( has_end && (len == end_pos) )) && [[ $WIDGET != zle-line-finish ]]
	then
		local -a tmp
		tmp=(${expanded_path}*(N)) 
		(( $#tmp > 0 )) && REPLY=path_prefix  && return 0
	fi
	return 1
}
_zsh_highlight_main_highlighter_expand_path () {
	(( $# == 1 )) || print -r -- "zsh-syntax-highlighting: BUG: _zsh_highlight_main_highlighter_expand_path: called without argument" >&2
	setopt localoptions nonomatch
	unset REPLY
	: ${REPLY:=${(Q)${~1}}}
}
_zsh_highlight_main_highlighter_highlight_argument () {
	local base_style=default i=$1 option_eligible=${2:-1} path_eligible=1 ret start style 
	local -a highlights
	local -a match mbegin mend
	local MATCH
	integer MBEGIN MEND
	case "$arg[i]" in
		('%') if [[ $arg[i+1] == '?' ]]
			then
				(( i += 2 ))
			fi ;;
		('-') if (( option_eligible ))
			then
				if [[ $arg[i+1] == - ]]
				then
					base_style=double-hyphen-option 
				else
					base_style=single-hyphen-option 
				fi
				path_eligible=0 
			fi ;;
		('=') if [[ $arg[i+1] == $'\x28' ]]
			then
				(( i += 2 ))
				_zsh_highlight_main_highlighter_highlight_list $(( start_pos + i - 1 )) S $has_end $arg[i,-1]
				ret=$? 
				(( i += REPLY ))
				highlights+=($(( start_pos + $1 - 1 )) $(( start_pos + i )) process-substitution $(( start_pos + $1 - 1 )) $(( start_pos + $1 + 1 )) process-substitution-delimiter $reply) 
				if (( ret == 0 ))
				then
					highlights+=($(( start_pos + i - 1 )) $(( start_pos + i )) process-substitution-delimiter) 
				fi
			fi ;;
	esac
	for ((; i <= $#arg ; i += 1 )) do
		case "$arg[$i]" in
			("\\") (( i += 1 ))
				continue ;;
			("'") _zsh_highlight_main_highlighter_highlight_single_quote $i
				(( i = REPLY ))
				highlights+=($reply)  ;;
			('"') _zsh_highlight_main_highlighter_highlight_double_quote $i
				(( i = REPLY ))
				highlights+=($reply)  ;;
			('`') _zsh_highlight_main_highlighter_highlight_backtick $i
				(( i = REPLY ))
				highlights+=($reply)  ;;
			('$') if [[ $arg[i+1] != "'" ]]
				then
					path_eligible=0 
				fi
				if [[ $arg[i+1] == "'" ]]
				then
					_zsh_highlight_main_highlighter_highlight_dollar_quote $i
					(( i = REPLY ))
					highlights+=($reply) 
					continue
				elif [[ $arg[i+1] == $'\x28' ]]
				then
					start=$i 
					(( i += 2 ))
					_zsh_highlight_main_highlighter_highlight_list $(( start_pos + i - 1 )) S $has_end $arg[i,-1]
					ret=$? 
					(( i += REPLY ))
					highlights+=($(( start_pos + start - 1)) $(( start_pos + i )) command-substitution-unquoted $(( start_pos + start - 1)) $(( start_pos + start + 1)) command-substitution-delimiter-unquoted $reply) 
					if (( ret == 0 ))
					then
						highlights+=($(( start_pos + i - 1)) $(( start_pos + i )) command-substitution-delimiter-unquoted) 
					fi
					continue
				fi
				while [[ $arg[i+1] == [\^=~#+] ]]
				do
					(( i += 1 ))
				done
				if [[ $arg[i+1] == [*@#?$!-] ]]
				then
					(( i += 1 ))
				fi ;;
			([\<\>]) if [[ $arg[i+1] == $'\x28' ]]
				then
					start=$i 
					(( i += 2 ))
					_zsh_highlight_main_highlighter_highlight_list $(( start_pos + i - 1 )) S $has_end $arg[i,-1]
					ret=$? 
					(( i += REPLY ))
					highlights+=($(( start_pos + start - 1)) $(( start_pos + i )) process-substitution $(( start_pos + start - 1)) $(( start_pos + start + 1 )) process-substitution-delimiter $reply) 
					if (( ret == 0 ))
					then
						highlights+=($(( start_pos + i - 1)) $(( start_pos + i )) process-substitution-delimiter) 
					fi
					continue
				fi ;|
			(*) if $highlight_glob && [[ ${arg[$i]} =~ ^[*?] || ${arg:$i-1} =~ ^\<[0-9]*-[0-9]*\> ]]
				then
					highlights+=($(( start_pos + i - 1 )) $(( start_pos + i + $#MATCH - 1)) globbing) 
					(( i += $#MATCH - 1 ))
					path_eligible=0 
				else
					continue
				fi ;;
		esac
	done
	if (( path_eligible )) && _zsh_highlight_main_highlighter_check_path $arg[$1,-1]
	then
		base_style=$REPLY 
		_zsh_highlight_main_highlighter_highlight_path_separators $base_style
		highlights+=($reply) 
	fi
	highlights=($(( start_pos + $1 - 1 )) $end_pos $base_style $highlights) 
	_zsh_highlight_main_add_many_region_highlights $highlights
}
_zsh_highlight_main_highlighter_highlight_backtick () {
	local buf highlight style=back-quoted-argument-unclosed style_end 
	local -i arg1=$1 end_ i=$1 last offset=0 start subshell_has_end=0 
	local -a highlight_zone highlights offsets
	reply=() 
	last=$(( arg1 + 1 )) 
	while i=$arg[(ib:i+1:)[\\\\\`]] 
	do
		if (( i > $#arg ))
		then
			buf=$buf$arg[last,i] 
			offsets[i-arg1-offset]='' 
			(( i-- ))
			subshell_has_end=$(( has_end && (start_pos + i == len) )) 
			break
		fi
		if [[ $arg[i] == '\' ]]
		then
			(( i++ ))
			if [[ $arg[i] == ('$'|'`'|'\') ]]
			then
				buf=$buf$arg[last,i-2] 
				(( offset++ ))
				offsets[i-arg1-offset]=$offset 
			else
				buf=$buf$arg[last,i-1] 
			fi
		else
			style=back-quoted-argument 
			style_end=back-quoted-argument-delimiter 
			buf=$buf$arg[last,i-1] 
			offsets[i-arg1-offset]='' 
			break
		fi
		last=$i 
	done
	_zsh_highlight_main_highlighter_highlight_list 0 '' $subshell_has_end $buf
	for start end_ highlight in $reply
	do
		start=$(( start_pos + arg1 + start + offsets[(Rb:start:)?*] )) 
		end_=$(( start_pos + arg1 + end_ + offsets[(Rb:end_:)?*] )) 
		highlights+=($start $end_ $highlight) 
		if [[ $highlight == back-quoted-argument-unclosed && $style == back-quoted-argument ]]
		then
			style_end=unknown-token 
		fi
	done
	reply=($(( start_pos + arg1 - 1 )) $(( start_pos + i )) $style $(( start_pos + arg1 - 1 )) $(( start_pos + arg1 )) back-quoted-argument-delimiter $highlights) 
	if (( $#style_end ))
	then
		reply+=($(( start_pos + i - 1)) $(( start_pos + i )) $style_end) 
	fi
	REPLY=$i 
}
_zsh_highlight_main_highlighter_highlight_dollar_quote () {
	local -a match mbegin mend
	local MATCH
	integer MBEGIN MEND
	local i j k style
	local AA
	integer c
	reply=() 
	for ((i = $1 + 2 ; i <= $#arg ; i += 1 )) do
		(( j = i + start_pos - 1 ))
		(( k = j + 1 ))
		case "$arg[$i]" in
			("'") break ;;
			("\\") style=back-dollar-quoted-argument 
				for ((c = i + 1 ; c <= $#arg ; c += 1 )) do
					[[ "$arg[$c]" != ([0-9xXuUa-fA-F]) ]] && break
				done
				AA=$arg[$i+1,$c-1] 
				if [[ "$AA" =~ "^(x|X)[0-9a-fA-F]{1,2}" || "$AA" =~ "^[0-7]{1,3}" || "$AA" =~ "^u[0-9a-fA-F]{1,4}" || "$AA" =~ "^U[0-9a-fA-F]{1,8}" ]]
				then
					(( k += $#MATCH ))
					(( i += $#MATCH ))
				else
					if (( $#arg > $i+1 )) && [[ $arg[$i+1] == [xXuU] ]]
					then
						style=unknown-token 
					fi
					(( k += 1 ))
					(( i += 1 ))
				fi ;;
			(*) continue ;;
		esac
		reply+=($j $k $style) 
	done
	if [[ $arg[i] == "'" ]]
	then
		style=dollar-quoted-argument 
	else
		(( i-- ))
		style=dollar-quoted-argument-unclosed 
	fi
	reply=($(( start_pos + $1 - 1 )) $(( start_pos + i )) $style $reply) 
	REPLY=$i 
}
_zsh_highlight_main_highlighter_highlight_double_quote () {
	local -a breaks match mbegin mend saved_reply
	local MATCH
	integer last_break=$(( start_pos + $1 - 1 )) MBEGIN MEND 
	local i j k ret style
	reply=() 
	for ((i = $1 + 1 ; i <= $#arg ; i += 1 )) do
		(( j = i + start_pos - 1 ))
		(( k = j + 1 ))
		case "$arg[$i]" in
			('"') break ;;
			('`') saved_reply=($reply) 
				_zsh_highlight_main_highlighter_highlight_backtick $i
				(( i = REPLY ))
				reply=($saved_reply $reply) 
				continue ;;
			('$') style=dollar-double-quoted-argument 
				if [[ ${arg:$i} =~ ^([A-Za-z_][A-Za-z0-9_]*|[0-9]+) ]]
				then
					(( k += $#MATCH ))
					(( i += $#MATCH ))
				elif [[ ${arg:$i} =~ ^[{]([A-Za-z_][A-Za-z0-9_]*|[0-9]+)[}] ]]
				then
					(( k += $#MATCH ))
					(( i += $#MATCH ))
				elif [[ $arg[i+1] == '$' ]]
				then
					(( k += 1 ))
					(( i += 1 ))
				elif [[ $arg[i+1] == [-#*@?] ]]
				then
					(( k += 1 ))
					(( i += 1 ))
				elif [[ $arg[i+1] == $'\x28' ]]
				then
					breaks+=($last_break $(( start_pos + i - 1 ))) 
					(( i += 2 ))
					saved_reply=($reply) 
					_zsh_highlight_main_highlighter_highlight_list $(( start_pos + i - 1 )) S $has_end $arg[i,-1]
					ret=$? 
					(( i += REPLY ))
					last_break=$(( start_pos + i )) 
					reply=($saved_reply $j $(( start_pos + i )) command-substitution-quoted $j $(( j + 2 )) command-substitution-delimiter-quoted $reply) 
					if (( ret == 0 ))
					then
						reply+=($(( start_pos + i - 1 )) $(( start_pos + i )) command-substitution-delimiter-quoted) 
					fi
					continue
				else
					continue
				fi ;;
			("\\") style=back-double-quoted-argument 
				if [[ \\\`\"\$${histchars[1]} == *$arg[$i+1]* ]]
				then
					(( k += 1 ))
					(( i += 1 ))
				else
					continue
				fi ;;
			($histchars[1]) if [[ $arg[i+1] != ('='|$'\x28'|$'\x7b'|[[:blank:]]) ]]
				then
					style=history-expansion 
				else
					continue
				fi ;;
			(*) continue ;;
		esac
		reply+=($j $k $style) 
	done
	if [[ $arg[i] == '"' ]]
	then
		style=double-quoted-argument 
	else
		(( i-- ))
		style=double-quoted-argument-unclosed 
	fi
	(( last_break != start_pos + i )) && breaks+=($last_break $(( start_pos + i ))) 
	saved_reply=($reply) 
	reply=() 
	for 1 2 in $breaks
	do
		(( $1 != $2 )) && reply+=($1 $2 $style) 
	done
	reply+=($saved_reply) 
	REPLY=$i 
}
_zsh_highlight_main_highlighter_highlight_list () {
	integer start_pos end_pos=0 buf_offset=$1 has_end=$3 
	local alias_style param_style arg buf=$4 highlight_glob=true style 
	local in_array_assignment=false 
	integer in_alias=0 in_param=0 len=$#buf 
	local -a match mbegin mend list_highlights
	local -A seen_alias
	readonly parameter_name_pattern='([A-Za-z_][A-Za-z0-9_]*|[0-9]+)' 
	list_highlights=() 
	local braces_stack=$2 
	local this_word next_word=':start::start_of_pipeline:' 
	integer in_redirection
	local proc_buf="$buf" 
	local -a args
	if [[ $zsyh_user_options[interactivecomments] == on ]]
	then
		args=(${(zZ+c+)buf}) 
	else
		args=(${(z)buf}) 
	fi
	while (( $#args ))
	do
		arg=$args[1] 
		shift args
		if (( in_alias ))
		then
			(( in_alias-- ))
			if (( in_alias == 0 ))
			then
				seen_alias=() 
				_zsh_highlight_main_add_region_highlight $start_pos $end_pos $alias_style
			fi
		fi
		if (( in_param ))
		then
			(( in_param-- ))
			if (( in_param == 0 ))
			then
				_zsh_highlight_main_add_region_highlight $start_pos $end_pos $param_style
				param_style="" 
			fi
		fi
		if (( in_redirection == 0 ))
		then
			this_word=$next_word 
			next_word=':regular:' 
		else
			(( --in_redirection ))
		fi
		style=unknown-token 
		if [[ $this_word == *':start:'* ]]
		then
			in_array_assignment=false 
			if [[ $arg == 'noglob' ]]
			then
				highlight_glob=false 
			fi
		fi
		if (( in_alias == 0 && in_param == 0 ))
		then
			[[ "$proc_buf" = (#b)(#s)(([ $'\t']|\\$'\n')#)* ]]
			integer offset="${#match[1]}" 
			(( start_pos = end_pos + offset ))
			(( end_pos = start_pos + $#arg ))
			proc_buf="${proc_buf[offset + $#arg + 1,len]}" 
		fi
		if [[ $zsyh_user_options[interactivecomments] == on && $arg[1] == $histchars[3] ]]
		then
			if [[ $this_word == *(':regular:'|':start:')* ]]
			then
				style=comment 
			else
				style=unknown-token 
			fi
			_zsh_highlight_main_add_region_highlight $start_pos $end_pos $style
			in_redirection=1 
			continue
		fi
		if [[ $this_word == *':start:'* ]] && ! (( in_redirection ))
		then
			_zsh_highlight_main__type "$arg" "$(( ! ${+seen_alias[$arg]} ))"
			local res="$REPLY" 
			if [[ $res == "alias" ]]
			then
				if [[ $arg == ?*=* ]]
				then
					(( in_alias == 0 )) && in_alias=1 
					_zsh_highlight_main_add_region_highlight $start_pos $end_pos unknown-token
					continue
				fi
				seen_alias[$arg]=1 
				_zsh_highlight_main__resolve_alias $arg
				local -a alias_args
				if [[ $zsyh_user_options[interactivecomments] == on ]]
				then
					alias_args=(${(zZ+c+)REPLY}) 
				else
					alias_args=(${(z)REPLY}) 
				fi
				args=($alias_args $args) 
				if (( in_alias == 0 ))
				then
					alias_style=alias 
					(( in_alias += $#alias_args + 1 ))
				else
					(( in_alias += $#alias_args ))
				fi
				(( in_redirection++ ))
				continue
			else
				_zsh_highlight_main_highlighter_expand_path $arg
				_zsh_highlight_main__type "$REPLY" 0
				res="$REPLY" 
			fi
		fi
		if _zsh_highlight_main__is_redirection $arg
		then
			if (( in_redirection == 1 ))
			then
				_zsh_highlight_main_add_region_highlight $start_pos $end_pos unknown-token
			else
				in_redirection=2 
				_zsh_highlight_main_add_region_highlight $start_pos $end_pos redirection
			fi
			continue
		elif [[ $arg == '{'${~parameter_name_pattern}'}' ]] && _zsh_highlight_main__is_redirection $args[1]
		then
			in_redirection=3 
			_zsh_highlight_main_add_region_highlight $start_pos $end_pos named-fd
			continue
		fi
		() {
			local -a match mbegin mend
			local MATCH
			integer MBEGIN MEND
			local parameter_name
			local -a words
			if [[ $arg[1] == '$' ]] && [[ ${arg[2]} == '{' ]] && [[ ${arg[-1]} == '}' ]]
			then
				parameter_name=${${arg:2}%?} 
			elif [[ $arg[1] == '$' ]]
			then
				parameter_name=${arg:1} 
			fi
			if [[ $res == none ]] && zmodload -e zsh/parameter && [[ ${parameter_name} =~ ^${~parameter_name_pattern}$ ]] && (( ${+parameters[(e)${MATCH}]} )) && [[ ${parameters[(e)$MATCH]} != *special* ]]
			then
				case ${(tP)MATCH} in
					(*array*|*assoc*) words=(${(P)MATCH})  ;;
					(*) words=(${(P)MATCH})  ;;
				esac
				(( in_param = 1 + $#words ))
				args=($words $args) 
				arg=$args[1] 
				_zsh_highlight_main__type "$arg" 0
				res=$REPLY 
			fi
		}
		if (( ! in_redirection ))
		then
			if [[ $this_word == *':sudo_opt:'* ]]
			then
				if [[ -n $flags_with_argument ]] && {
						[[ -n $flags_sans_argument ]] && [[ $arg == '-'[$flags_sans_argument]#[$flags_with_argument] ]] || [[ $arg == '-'[$flags_with_argument] ]]
					}
				then
					this_word=${this_word//:start:/} 
					next_word=':sudo_arg:' 
				elif [[ -n $flags_with_argument ]] && {
						[[ -n $flags_sans_argument ]] && [[ $arg == '-'[$flags_sans_argument]#[$flags_with_argument]* ]] || [[ $arg == '-'[$flags_with_argument]* ]]
					}
				then
					this_word=${this_word//:start:/} 
					next_word+=':start:' 
					next_word+=':sudo_opt:' 
				elif [[ -n $flags_sans_argument ]] && [[ $arg == '-'[$flags_sans_argument]# ]]
				then
					this_word=':sudo_opt:' 
					next_word+=':start:' 
					next_word+=':sudo_opt:' 
				elif [[ $arg == '-'* ]]
				then
					this_word=':sudo_opt:' 
					next_word+=':start:' 
					next_word+=':sudo_opt:' 
				else
					this_word=${this_word//:sudo_opt:/} 
				fi
			elif [[ $this_word == *':sudo_arg:'* ]]
			then
				next_word+=':sudo_opt:' 
				next_word+=':start:' 
			fi
		fi
		if [[ -n ${(M)ZSH_HIGHLIGHT_TOKENS_COMMANDSEPARATOR:#"$arg"} ]]
		then
			if _zsh_highlight_main__stack_pop T || _zsh_highlight_main__stack_pop Q
			then
				style=unknown-token 
			elif [[ $this_word == *':regular:'* ]]
			then
				style=commandseparator 
			else
				style=unknown-token 
			fi
			if [[ $arg == ';' ]] && $in_array_assignment
			then
				next_word=':regular:' 
			else
				next_word=':start:' 
				highlight_glob=true 
				if [[ $arg != '|' && $arg != '|&' ]]
				then
					next_word+=':start_of_pipeline:' 
				fi
			fi
		elif ! (( in_redirection)) && [[ $this_word == *':always:'* && $arg == 'always' ]]
		then
			style=reserved-word 
			next_word=':start:' 
		elif ! (( in_redirection)) && [[ $this_word == *':start:'* ]]
		then
			if (( ${+precommand_options[$arg]} )) && _zsh_highlight_main__is_runnable $arg
			then
				style=precommand 
				flags_with_argument=${precommand_options[$arg]%:*} 
				flags_sans_argument=${precommand_options[$arg]#*:} 
				next_word=${next_word//:regular:/} 
				next_word+=':sudo_opt:' 
				next_word+=':start:' 
			else
				case $res in
					(reserved) style=reserved-word 
						case $arg in
							(time|nocorrect) next_word=${next_word//:regular:/} 
								next_word+=':start:'  ;;
							($'\x7b') braces_stack='Y'"$braces_stack"  ;;
							($'\x7d') _zsh_highlight_main__stack_pop 'Y' reserved-word
								if [[ $style == reserved-word ]]
								then
									next_word+=':always:' 
								fi ;;
							($'\x5b\x5b') braces_stack='T'"$braces_stack"  ;;
							('do') braces_stack='D'"$braces_stack"  ;;
							('done') _zsh_highlight_main__stack_pop 'D' reserved-word ;;
							('if') braces_stack=':?'"$braces_stack"  ;;
							('then') _zsh_highlight_main__stack_pop ':' reserved-word ;;
							('elif') if [[ ${braces_stack[1]} == '?' ]]
								then
									braces_stack=':'"$braces_stack" 
								else
									style=unknown-token 
								fi ;;
							('else') if [[ ${braces_stack[1]} == '?' ]]
								then
									:
								else
									style=unknown-token 
								fi ;;
							('fi') _zsh_highlight_main__stack_pop '?' ;;
							('foreach') braces_stack='$'"$braces_stack"  ;;
							('end') _zsh_highlight_main__stack_pop '$' reserved-word ;;
							('repeat') in_redirection=2 
								this_word=':start::regular:'  ;;
							('!') if [[ $this_word != *':start_of_pipeline:'* ]]
								then
									style=unknown-token 
								else
									
								fi ;;
						esac ;;
					('suffix alias') style=suffix-alias  ;;
					(alias) : ;;
					(builtin) style=builtin 
						[[ $arg == $'\x5b' ]] && braces_stack='Q'"$braces_stack"  ;;
					(function) style=function  ;;
					(command) style=command  ;;
					(hashed) style=hashed-command  ;;
					(none) if (( ! in_param )) && _zsh_highlight_main_highlighter_check_assign
						then
							_zsh_highlight_main_add_region_highlight $start_pos $end_pos assign
							local i=$(( arg[(i)=] + 1 )) 
							if [[ $arg[i] == '(' ]]
							then
								in_array_assignment=true 
							else
								next_word+=':start:' 
								if (( i <= $#arg ))
								then
									() {
										local highlight_glob=false 
										[[ $zsyh_user_options[globassign] == on ]] && highlight_glob=true 
										_zsh_highlight_main_highlighter_highlight_argument $i
									}
								fi
							fi
							continue
						elif (( ! in_param )) && [[ $arg[0,1] = $histchars[0,1] ]] && (( $#arg[0,2] == 2 ))
						then
							style=history-expansion 
						elif (( ! in_param )) && [[ $arg[0,1] == $histchars[2,2] ]]
						then
							style=history-expansion 
						elif (( ! in_param )) && [[ $arg[1,2] == '((' ]]
						then
							_zsh_highlight_main_add_region_highlight $start_pos $((start_pos + 2)) reserved-word
							if [[ $arg[-2,-1] == '))' ]]
							then
								_zsh_highlight_main_add_region_highlight $((end_pos - 2)) $end_pos reserved-word
							fi
							continue
						elif (( ! in_param )) && [[ $arg == '()' ]]
						then
							style=reserved-word 
						elif (( ! in_param )) && [[ $arg == $'\x28' ]]
						then
							style=reserved-word 
							braces_stack='R'"$braces_stack" 
						elif (( ! in_param )) && [[ $arg == $'\x29' ]]
						then
							if _zsh_highlight_main__stack_pop 'S'
							then
								REPLY=$start_pos 
								reply=($list_highlights) 
								return 0
							fi
							_zsh_highlight_main__stack_pop 'R' reserved-word
						else
							if _zsh_highlight_main_highlighter_check_path $arg
							then
								style=$REPLY 
							else
								style=unknown-token 
							fi
						fi ;;
					(*) _zsh_highlight_main_add_region_highlight $start_pos $end_pos arg0_$res
						continue ;;
				esac
			fi
			if [[ -n ${(M)ZSH_HIGHLIGHT_TOKENS_CONTROL_FLOW:#"$arg"} ]]
			then
				next_word=':start::start_of_pipeline:' 
			fi
		else
			case $arg in
				($'\x29') if $in_array_assignment
					then
						style=assign 
						in_array_assignment=false 
						next_word+=':start:' 
					elif (( in_redirection ))
					then
						style=unknown-token 
					else
						if _zsh_highlight_main__stack_pop 'S'
						then
							REPLY=$start_pos 
							reply=($list_highlights) 
							return 0
						fi
						_zsh_highlight_main__stack_pop 'R' reserved-word
					fi ;;
				($'\x28\x29') if (( in_redirection )) || $in_array_assignment
					then
						style=unknown-token 
					else
						if [[ $zsyh_user_options[multifuncdef] == on ]] || false
						then
							next_word+=':start::start_of_pipeline:' 
						fi
						style=reserved-word 
					fi ;;
				(*) if false
					then
						
					elif [[ $arg = $'\x7d' ]] && $right_brace_is_recognised_everywhere
					then
						if (( in_redirection )) || $in_array_assignment
						then
							style=unknown-token 
						else
							_zsh_highlight_main__stack_pop 'Y' reserved-word
							if [[ $style == reserved-word ]]
							then
								next_word+=':always:' 
							fi
						fi
					elif [[ $arg[0,1] = $histchars[0,1] ]] && (( $#arg[0,2] == 2 ))
					then
						style=history-expansion 
					elif [[ $arg == $'\x5d\x5d' ]] && _zsh_highlight_main__stack_pop 'T' reserved-word
					then
						:
					elif [[ $arg == $'\x5d' ]] && _zsh_highlight_main__stack_pop 'Q' builtin
					then
						:
					else
						_zsh_highlight_main_highlighter_highlight_argument 1 $(( 1 != in_redirection ))
						continue
					fi ;;
			esac
		fi
		_zsh_highlight_main_add_region_highlight $start_pos $end_pos $style
	done
	(( in_alias == 1 )) && in_alias=0 _zsh_highlight_main_add_region_highlight $start_pos $end_pos $alias_style
	(( in_param == 1 )) && in_param=0 _zsh_highlight_main_add_region_highlight $start_pos $end_pos $param_style
	[[ "$proc_buf" = (#b)(#s)(([[:space:]]|\\$'\n')#) ]]
	REPLY=$(( end_pos + ${#match[1]} - 1 )) 
	reply=($list_highlights) 
	return $(( $#braces_stack > 0 ))
}
_zsh_highlight_main_highlighter_highlight_path_separators () {
	local pos style_pathsep
	style_pathsep=$1_pathseparator 
	reply=() 
	[[ -z "$ZSH_HIGHLIGHT_STYLES[$style_pathsep]" || "$ZSH_HIGHLIGHT_STYLES[$1]" == "$ZSH_HIGHLIGHT_STYLES[$style_pathsep]" ]] && return 0
	for ((pos = start_pos; $pos <= end_pos; pos++ )) do
		if [[ $BUFFER[pos] == / ]]
		then
			reply+=($((pos - 1)) $pos $style_pathsep) 
		fi
	done
}
_zsh_highlight_main_highlighter_highlight_single_quote () {
	local arg1=$1 i q=\' style 
	i=$arg[(ib:arg1+1:)$q] 
	reply=() 
	if [[ $zsyh_user_options[rcquotes] == on ]]
	then
		while [[ $arg[i+1] == "'" ]]
		do
			reply+=($(( start_pos + i - 1 )) $(( start_pos + i + 1 )) rc-quote) 
			(( i++ ))
			i=$arg[(ib:i+1:)$q] 
		done
	fi
	if [[ $arg[i] == "'" ]]
	then
		style=single-quoted-argument 
	else
		(( i-- ))
		style=single-quoted-argument-unclosed 
	fi
	reply=($(( start_pos + arg1 - 1 )) $(( start_pos + i )) $style $reply) 
	REPLY=$i 
}
_zsh_highlight_pattern_highlighter_loop () {
	local buf="$1" pat="$2" 
	local -a match mbegin mend
	local MATCH
	integer MBEGIN MEND
	if [[ "$buf" == (#b)(*)(${~pat})* ]]
	then
		region_highlight+=("$((mbegin[2] - 1)) $mend[2] $ZSH_HIGHLIGHT_PATTERNS[$pat]") 
		"$0" "$match[1]" "$pat"
		return $?
	fi
}
_zsh_highlight_preexec_hook () {
	typeset -g _ZSH_HIGHLIGHT_PRIOR_BUFFER= 
	typeset -gi _ZSH_HIGHLIGHT_PRIOR_CURSOR= 
}
_zsh_highlight_regexp_highlighter_loop () {
	local buf="$1" pat="$2" 
	integer OFFSET=0 
	local MATCH
	integer MBEGIN MEND
	local -a match mbegin mend
	while true
	do
		[[ "$buf" =~ "$pat" ]] || return
		region_highlight+=("$((MBEGIN - 1 + OFFSET)) $((MEND + OFFSET)) $ZSH_HIGHLIGHT_REGEXP[$pat]") 
		buf="$buf[$(($MEND+1)),-1]" 
		OFFSET=$((MEND+OFFSET)) 
	done
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_bash_complete-word () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_bash_complete-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_bash_list-choices () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_bash_list-choices -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_complete_debug () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_complete_debug -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_complete_help () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_complete_help -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_complete_tag () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_complete_tag -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_correct_filename () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_correct_filename -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_correct_word () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_correct_word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_expand_alias () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_expand_alias -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_expand_word () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_expand_word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_history-complete-newer () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_history-complete-newer -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_history-complete-older () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_history-complete-older -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_list_expansions () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_list_expansions -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_most_recent_file () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_most_recent_file -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_next_tags () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_next_tags -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-_read_comp () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-_read_comp -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-accept-and-hold () {
	_zsh_highlight_call_widget .accept-and-hold -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-accept-and-infer-next-history () {
	_zsh_highlight_call_widget .accept-and-infer-next-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-accept-and-menu-complete () {
	_zsh_highlight_call_widget .accept-and-menu-complete -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-accept-line () {
	_zsh_highlight_call_widget .accept-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-accept-line-and-down-history () {
	_zsh_highlight_call_widget .accept-line-and-down-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-accept-search () {
	_zsh_highlight_call_widget .accept-search -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-apps () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-apps -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-argument-base () {
	_zsh_highlight_call_widget .argument-base -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-auto-suffix-remove () {
	_zsh_highlight_call_widget .auto-suffix-remove -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-auto-suffix-retain () {
	_zsh_highlight_call_widget .auto-suffix-retain -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-backward-char () {
	_zsh_highlight_call_widget .backward-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-backward-delete-char () {
	_zsh_highlight_call_widget .backward-delete-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-backward-delete-word () {
	_zsh_highlight_call_widget .backward-delete-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-backward-kill-line () {
	_zsh_highlight_call_widget .backward-kill-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-backward-kill-word () {
	_zsh_highlight_call_widget .backward-kill-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-backward-word () {
	_zsh_highlight_call_widget .backward-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-beginning-of-buffer-or-history () {
	_zsh_highlight_call_widget .beginning-of-buffer-or-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-beginning-of-history () {
	_zsh_highlight_call_widget .beginning-of-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-beginning-of-line () {
	_zsh_highlight_call_widget .beginning-of-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-beginning-of-line-hist () {
	_zsh_highlight_call_widget .beginning-of-line-hist -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-bracketed-paste () {
	_zsh_highlight_call_widget .bracketed-paste -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-capitalize-word () {
	_zsh_highlight_call_widget .capitalize-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-clear-screen () {
	_zsh_highlight_call_widget .clear-screen -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-complete-word () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-complete-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-config () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-config -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-copy-prev-shell-word () {
	_zsh_highlight_call_widget .copy-prev-shell-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-copy-prev-word () {
	_zsh_highlight_call_widget .copy-prev-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-copy-region-as-kill () {
	_zsh_highlight_call_widget .copy-region-as-kill -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-deactivate-region () {
	_zsh_highlight_call_widget .deactivate-region -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-delete-char () {
	_zsh_highlight_call_widget .delete-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-delete-char-or-list () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-delete-char-or-list -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-delete-word () {
	_zsh_highlight_call_widget .delete-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-describe-key-briefly () {
	_zsh_highlight_call_widget .describe-key-briefly -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-digit-argument () {
	_zsh_highlight_call_widget .digit-argument -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-down-case-word () {
	_zsh_highlight_call_widget .down-case-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-down-history () {
	_zsh_highlight_call_widget .down-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-down-line () {
	_zsh_highlight_call_widget .down-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-down-line-or-history () {
	_zsh_highlight_call_widget .down-line-or-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-down-line-or-search () {
	_zsh_highlight_call_widget .down-line-or-search -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-edit-command-line () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-edit-command-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-emacs-backward-word () {
	_zsh_highlight_call_widget .emacs-backward-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-emacs-forward-word () {
	_zsh_highlight_call_widget .emacs-forward-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-end-of-buffer-or-history () {
	_zsh_highlight_call_widget .end-of-buffer-or-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-end-of-history () {
	_zsh_highlight_call_widget .end-of-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-end-of-line () {
	_zsh_highlight_call_widget .end-of-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-end-of-line-hist () {
	_zsh_highlight_call_widget .end-of-line-hist -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-end-of-list () {
	_zsh_highlight_call_widget .end-of-list -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-exchange-point-and-mark () {
	_zsh_highlight_call_widget .exchange-point-and-mark -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-exconf () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-exconf -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-execute-last-named-cmd () {
	_zsh_highlight_call_widget .execute-last-named-cmd -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-execute-named-cmd () {
	_zsh_highlight_call_widget .execute-named-cmd -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-expand-cmd-path () {
	_zsh_highlight_call_widget .expand-cmd-path -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-expand-history () {
	_zsh_highlight_call_widget .expand-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-expand-or-complete () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-expand-or-complete -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-expand-or-complete-prefix () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-expand-or-complete-prefix -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-expand-word () {
	_zsh_highlight_call_widget .expand-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-forward-char () {
	_zsh_highlight_call_widget .forward-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-forward-word () {
	_zsh_highlight_call_widget .forward-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-fzf-cd-widget () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-fzf-cd-widget -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-fzf-completion () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-fzf-completion -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-fzf-file-widget () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-fzf-file-widget -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-fzf-history-widget () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-fzf-history-widget -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-get-line () {
	_zsh_highlight_call_widget .get-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-gosmacs-transpose-chars () {
	_zsh_highlight_call_widget .gosmacs-transpose-chars -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-history-beginning-search-backward () {
	_zsh_highlight_call_widget .history-beginning-search-backward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-history-beginning-search-forward () {
	_zsh_highlight_call_widget .history-beginning-search-forward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-history-incremental-pattern-search-backward () {
	_zsh_highlight_call_widget .history-incremental-pattern-search-backward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-history-incremental-pattern-search-forward () {
	_zsh_highlight_call_widget .history-incremental-pattern-search-forward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-history-incremental-search-backward () {
	_zsh_highlight_call_widget .history-incremental-search-backward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-history-incremental-search-forward () {
	_zsh_highlight_call_widget .history-incremental-search-forward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-history-search-backward () {
	_zsh_highlight_call_widget .history-search-backward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-history-search-forward () {
	_zsh_highlight_call_widget .history-search-forward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-infer-next-history () {
	_zsh_highlight_call_widget .infer-next-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-insert-last-word () {
	_zsh_highlight_call_widget .insert-last-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-kill-buffer () {
	_zsh_highlight_call_widget .kill-buffer -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-kill-line () {
	_zsh_highlight_call_widget .kill-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-kill-region () {
	_zsh_highlight_call_widget .kill-region -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-kill-whole-line () {
	_zsh_highlight_call_widget .kill-whole-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-kill-word () {
	_zsh_highlight_call_widget .kill-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-lewd () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-lewd -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-list-choices () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-list-choices -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-list-expand () {
	_zsh_highlight_call_widget .list-expand -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-lrock () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-lrock -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-luap () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-luap -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-magic-space () {
	_zsh_highlight_call_widget .magic-space -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-menu-complete () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-menu-complete -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-menu-expand-or-complete () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-menu-expand-or-complete -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-neg-argument () {
	_zsh_highlight_call_widget .neg-argument -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-overwrite-mode () {
	_zsh_highlight_call_widget .overwrite-mode -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-plug () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-plug -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-pound-insert () {
	_zsh_highlight_call_widget .pound-insert -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-program () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-program -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-push-input () {
	_zsh_highlight_call_widget .push-input -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-push-line () {
	_zsh_highlight_call_widget .push-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-push-line-or-edit () {
	_zsh_highlight_call_widget .push-line-or-edit -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-put-replace-selection () {
	_zsh_highlight_call_widget .put-replace-selection -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-quote-line () {
	_zsh_highlight_call_widget .quote-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-quote-region () {
	_zsh_highlight_call_widget .quote-region -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-quoted-insert () {
	_zsh_highlight_call_widget .quoted-insert -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-read-command () {
	_zsh_highlight_call_widget .read-command -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-recursive-edit () {
	_zsh_highlight_call_widget .recursive-edit -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-redisplay () {
	_zsh_highlight_call_widget .redisplay -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-redo () {
	_zsh_highlight_call_widget .redo -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-reset-prompt () {
	_zsh_highlight_call_widget .reset-prompt -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-reverse-menu-complete () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-reverse-menu-complete -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-select-a-blank-word () {
	_zsh_highlight_call_widget .select-a-blank-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-select-a-shell-word () {
	_zsh_highlight_call_widget .select-a-shell-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-select-a-word () {
	_zsh_highlight_call_widget .select-a-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-select-in-blank-word () {
	_zsh_highlight_call_widget .select-in-blank-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-select-in-shell-word () {
	_zsh_highlight_call_widget .select-in-shell-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-select-in-word () {
	_zsh_highlight_call_widget .select-in-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-self-insert () {
	_zsh_highlight_call_widget .self-insert -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-self-insert-unmeta () {
	_zsh_highlight_call_widget .self-insert-unmeta -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-send-break () {
	_zsh_highlight_call_widget .send-break -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-set-mark-command () {
	_zsh_highlight_call_widget .set-mark-command -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-spell () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-spell -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-spell-word () {
	_zsh_highlight_call_widget .spell-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-split-undo () {
	_zsh_highlight_call_widget .split-undo -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-transpose-chars () {
	_zsh_highlight_call_widget .transpose-chars -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-transpose-words () {
	_zsh_highlight_call_widget .transpose-words -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-undefined-key () {
	_zsh_highlight_call_widget .undefined-key -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-undo () {
	_zsh_highlight_call_widget .undo -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-universal-argument () {
	_zsh_highlight_call_widget .universal-argument -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-up-case-word () {
	_zsh_highlight_call_widget .up-case-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-up-history () {
	_zsh_highlight_call_widget .up-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-up-line () {
	_zsh_highlight_call_widget .up-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-up-line-or-history () {
	_zsh_highlight_call_widget .up-line-or-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-up-line-or-search () {
	_zsh_highlight_call_widget .up-line-or-search -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vconf () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-vconf -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-add-eol () {
	_zsh_highlight_call_widget .vi-add-eol -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-add-next () {
	_zsh_highlight_call_widget .vi-add-next -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-backward-blank-word () {
	_zsh_highlight_call_widget .vi-backward-blank-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-backward-blank-word-end () {
	_zsh_highlight_call_widget .vi-backward-blank-word-end -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-backward-char () {
	_zsh_highlight_call_widget .vi-backward-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-backward-delete-char () {
	_zsh_highlight_call_widget .vi-backward-delete-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-backward-kill-word () {
	_zsh_highlight_call_widget .vi-backward-kill-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-backward-word () {
	_zsh_highlight_call_widget .vi-backward-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-backward-word-end () {
	_zsh_highlight_call_widget .vi-backward-word-end -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-beginning-of-line () {
	_zsh_highlight_call_widget .vi-beginning-of-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-caps-lock-panic () {
	_zsh_highlight_call_widget .vi-caps-lock-panic -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-change () {
	_zsh_highlight_call_widget .vi-change -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-change-eol () {
	_zsh_highlight_call_widget .vi-change-eol -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-change-whole-line () {
	_zsh_highlight_call_widget .vi-change-whole-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-cmd-mode () {
	_zsh_highlight_call_widget .vi-cmd-mode -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-delete () {
	_zsh_highlight_call_widget .vi-delete -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-delete-char () {
	_zsh_highlight_call_widget .vi-delete-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-digit-or-beginning-of-line () {
	_zsh_highlight_call_widget .vi-digit-or-beginning-of-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-down-case () {
	_zsh_highlight_call_widget .vi-down-case -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-down-line-or-history () {
	_zsh_highlight_call_widget .vi-down-line-or-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-end-of-line () {
	_zsh_highlight_call_widget .vi-end-of-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-fetch-history () {
	_zsh_highlight_call_widget .vi-fetch-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-find-next-char () {
	_zsh_highlight_call_widget .vi-find-next-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-find-next-char-skip () {
	_zsh_highlight_call_widget .vi-find-next-char-skip -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-find-prev-char () {
	_zsh_highlight_call_widget .vi-find-prev-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-find-prev-char-skip () {
	_zsh_highlight_call_widget .vi-find-prev-char-skip -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-first-non-blank () {
	_zsh_highlight_call_widget .vi-first-non-blank -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-forward-blank-word () {
	_zsh_highlight_call_widget .vi-forward-blank-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-forward-blank-word-end () {
	_zsh_highlight_call_widget .vi-forward-blank-word-end -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-forward-char () {
	_zsh_highlight_call_widget .vi-forward-char -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-forward-word () {
	_zsh_highlight_call_widget .vi-forward-word -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-forward-word-end () {
	_zsh_highlight_call_widget .vi-forward-word-end -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-goto-column () {
	_zsh_highlight_call_widget .vi-goto-column -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-goto-mark () {
	_zsh_highlight_call_widget .vi-goto-mark -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-goto-mark-line () {
	_zsh_highlight_call_widget .vi-goto-mark-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-history-search-backward () {
	_zsh_highlight_call_widget .vi-history-search-backward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-history-search-forward () {
	_zsh_highlight_call_widget .vi-history-search-forward -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-indent () {
	_zsh_highlight_call_widget .vi-indent -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-insert () {
	_zsh_highlight_call_widget .vi-insert -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-insert-bol () {
	_zsh_highlight_call_widget .vi-insert-bol -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-join () {
	_zsh_highlight_call_widget .vi-join -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-kill-eol () {
	_zsh_highlight_call_widget .vi-kill-eol -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-kill-line () {
	_zsh_highlight_call_widget .vi-kill-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-match-bracket () {
	_zsh_highlight_call_widget .vi-match-bracket -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-open-line-above () {
	_zsh_highlight_call_widget .vi-open-line-above -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-open-line-below () {
	_zsh_highlight_call_widget .vi-open-line-below -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-oper-swap-case () {
	_zsh_highlight_call_widget .vi-oper-swap-case -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-pound-insert () {
	_zsh_highlight_call_widget .vi-pound-insert -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-put-after () {
	_zsh_highlight_call_widget .vi-put-after -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-put-before () {
	_zsh_highlight_call_widget .vi-put-before -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-quoted-insert () {
	_zsh_highlight_call_widget .vi-quoted-insert -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-repeat-change () {
	_zsh_highlight_call_widget .vi-repeat-change -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-repeat-find () {
	_zsh_highlight_call_widget .vi-repeat-find -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-repeat-search () {
	_zsh_highlight_call_widget .vi-repeat-search -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-replace () {
	_zsh_highlight_call_widget .vi-replace -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-replace-chars () {
	_zsh_highlight_call_widget .vi-replace-chars -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-rev-repeat-find () {
	_zsh_highlight_call_widget .vi-rev-repeat-find -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-rev-repeat-search () {
	_zsh_highlight_call_widget .vi-rev-repeat-search -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-set-buffer () {
	_zsh_highlight_call_widget .vi-set-buffer -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-set-mark () {
	_zsh_highlight_call_widget .vi-set-mark -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-substitute () {
	_zsh_highlight_call_widget .vi-substitute -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-swap-case () {
	_zsh_highlight_call_widget .vi-swap-case -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-undo-change () {
	_zsh_highlight_call_widget .vi-undo-change -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-unindent () {
	_zsh_highlight_call_widget .vi-unindent -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-up-case () {
	_zsh_highlight_call_widget .vi-up-case -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-up-line-or-history () {
	_zsh_highlight_call_widget .vi-up-line-or-history -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-yank () {
	_zsh_highlight_call_widget .vi-yank -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-yank-eol () {
	_zsh_highlight_call_widget .vi-yank-eol -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-vi-yank-whole-line () {
	_zsh_highlight_call_widget .vi-yank-whole-line -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-visual-line-mode () {
	_zsh_highlight_call_widget .visual-line-mode -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-visual-mode () {
	_zsh_highlight_call_widget .visual-mode -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-what-cursor-position () {
	_zsh_highlight_call_widget .what-cursor-position -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-where-is () {
	_zsh_highlight_call_widget .where-is -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-zconf () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-zconf -- "$@"
}
_zsh_highlight_widget_orig-s0.0000010000-r7760-zle-keymap-select () {
	_zsh_highlight_call_widget orig-s0.0000010000-r7760-zle-keymap-select -- "$@"
}
_zsh_highlight_widget_zle-isearch-update () {
	:
	_zsh_highlight
}
_zsh_highlight_widget_zle-line-finish () {
	:
	_zsh_highlight
}
_zsocket () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_zstyle () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
_ztodo () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion/Zsh
}
aa () {
	ansible machines:all -b -m community.general.pacman -a "name=$1"
}
add-target () {
	ansible "$1" -b -m community.general.pacman -a "name=$2"
}
add-zsh-hook () {
	emulate -L zsh
	local -a hooktypes
	hooktypes=(chpwd precmd preexec periodic zshaddhistory zshexit zsh_directory_name) 
	local usage="Usage: add-zsh-hook hook function\nValid hooks are:\n  $hooktypes" 
	local opt
	local -a autoopts
	integer del list help
	while getopts "dDhLUzk" opt
	do
		case $opt in
			(d) del=1  ;;
			(D) del=2  ;;
			(h) help=1  ;;
			(L) list=1  ;;
			([Uzk]) autoopts+=(-$opt)  ;;
			(*) return 1 ;;
		esac
	done
	shift $(( OPTIND - 1 ))
	if (( list ))
	then
		typeset -mp "(${1:-${(@j:|:)hooktypes}})_functions"
		return $?
	elif (( help || $# != 2 || ${hooktypes[(I)$1]} == 0 ))
	then
		print -u$(( 2 - help )) $usage
		return $(( 1 - help ))
	fi
	local hook="${1}_functions" 
	local fn="$2" 
	if (( del ))
	then
		if (( ${(P)+hook} ))
		then
			if (( del == 2 ))
			then
				set -A $hook ${(P)hook:#${~fn}}
			else
				set -A $hook ${(P)hook:#$fn}
			fi
			if (( ! ${(P)#hook} ))
			then
				unset $hook
			fi
		fi
	else
		if (( ${(P)+hook} ))
		then
			if (( ${${(P)hook}[(I)$fn]} == 0 ))
			then
				typeset -ga $hook
				set -A $hook ${(P)hook} $fn
			fi
		else
			typeset -ga $hook
			set -A $hook $fn
		fi
		autoload $autoopts -- $fn
	fi
}
addgroup () {
	aws iam create-group --group-name $@
}
addgrouph () {
	echo "group-name"
}
addpolicy () {
	aws iam put-group-policy --group-name $1 --policy-document $2 --policy-name $3
}
addpolicyh () {
	echo "group-name, policy-document, policy-name\n HINT: use 'file://<fileName>' if the policy is too large!"
}
adduser () {
	aws iam add-user-to-group --group-name $1 --user-name $2
}
adduserh () {
	echo "group-name, user-name"
}
al () {
	ansible laptops:all -m community.general.pacman -a "name=$1"
}
apis () {
	ansible pi:all -m community.general.pacman -a "name=$1"
}
apps () {
	pushd ~/codebase/
	nvim $(fd -tf --full-path ~/codebase/ | fzf --layout reverse --border --border-label='Codebase' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
awsc () {
	aws $@ --profile cMonty614
}
awsinit () {
	sed -i 's-#aws.zsh-source ~/.zsh/tooling/aws.zsh-' ~/.zshenv
	source ~/.zshenv
}
awsn () {
	aws $@ --profile n0ko
}
awsoff () {
	sed -i 's-source ~/.zsh/tooling/aws.zsh-#aws.zsh-' ~/.zshenv
	source ~/.zshenv
}
awsuser () {
	aws iam list-users $@
}
awsuserls () {
	aws iam list-users
}
basecopy () {
	scp $1 n0ko@base:$2
}
basecopyr () {
	scp -r $1 n0ko@base:$2
}
bashcompinit () {
	# undefined
	builtin autoload -XUz
}
bs () {
	nvim ~/capacity/repos/scripts/bin/$(cd ~/capacity/repos/scripts/bin && exa | fzf --layout reverse --border --border-label='Capacity Scripts' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
c () {
	cd $1
	nvim $(lister.sh)
}
cc () {
	gcc $1 -Wall -o $2
	./$2
}
cf () {
	cl $(flist $( fd -td ))
}
cfd () {
	c $(fd -td $1)
}
chx () {
	chmod +x $1
}
ci () {
	cargo install $1
}
cjauth () {
	cj='/home/n0ko/.config/neomutt/tokens/cj/' 
	pushd $cj
	if [[ -f $cj ]]
	then
		rm chrismontgomeryjr@gmail.com && ./mutt_oauth2.py chrismontgomeryjr@gmail.com --authorize
	else
		./mutt_oauth2.py chrismontgomeryjr@gmail.com --authorize
	fi
}
cl () {
	cd $1
	colorls --git-status
}
compaudit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion
}
compdef () {
	local opt autol type func delete eval new i ret=0 cmd svc 
	local -a match mbegin mend
	emulate -L zsh
	setopt extendedglob
	if (( ! $# ))
	then
		print -u2 "$0: I need arguments"
		return 1
	fi
	while getopts "anpPkKde" opt
	do
		case "$opt" in
			(a) autol=yes  ;;
			(n) new=yes  ;;
			([pPkK]) if [[ -n "$type" ]]
				then
					print -u2 "$0: type already set to $type"
					return 1
				fi
				if [[ "$opt" = p ]]
				then
					type=pattern 
				elif [[ "$opt" = P ]]
				then
					type=postpattern 
				elif [[ "$opt" = K ]]
				then
					type=widgetkey 
				else
					type=key 
				fi ;;
			(d) delete=yes  ;;
			(e) eval=yes  ;;
		esac
	done
	shift OPTIND-1
	if (( ! $# ))
	then
		print -u2 "$0: I need arguments"
		return 1
	fi
	if [[ -z "$delete" ]]
	then
		if [[ -z "$eval" ]] && [[ "$1" = *\=* ]]
		then
			while (( $# ))
			do
				if [[ "$1" = *\=* ]]
				then
					cmd="${1%%\=*}" 
					svc="${1#*\=}" 
					func="$_comps[${_services[(r)$svc]:-$svc}]" 
					[[ -n ${_services[$svc]} ]] && svc=${_services[$svc]} 
					[[ -z "$func" ]] && func="${${_patcomps[(K)$svc][1]}:-${_postpatcomps[(K)$svc][1]}}" 
					if [[ -n "$func" ]]
					then
						_comps[$cmd]="$func" 
						_services[$cmd]="$svc" 
					else
						print -u2 "$0: unknown command or service: $svc"
						ret=1 
					fi
				else
					print -u2 "$0: invalid argument: $1"
					ret=1 
				fi
				shift
			done
			return ret
		fi
		func="$1" 
		[[ -n "$autol" ]] && autoload -rUz "$func"
		shift
		case "$type" in
			(widgetkey) while [[ -n $1 ]]
				do
					if [[ $# -lt 3 ]]
					then
						print -u2 "$0: compdef -K requires <widget> <comp-widget> <key>"
						return 1
					fi
					[[ $1 = _* ]] || 1="_$1" 
					[[ $2 = .* ]] || 2=".$2" 
					[[ $2 = .menu-select ]] && zmodload -i zsh/complist
					zle -C "$1" "$2" "$func"
					if [[ -n $new ]]
					then
						bindkey "$3" | IFS=$' \t' read -A opt
						[[ $opt[-1] = undefined-key ]] && bindkey "$3" "$1"
					else
						bindkey "$3" "$1"
					fi
					shift 3
				done ;;
			(key) if [[ $# -lt 2 ]]
				then
					print -u2 "$0: missing keys"
					return 1
				fi
				if [[ $1 = .* ]]
				then
					[[ $1 = .menu-select ]] && zmodload -i zsh/complist
					zle -C "$func" "$1" "$func"
				else
					[[ $1 = menu-select ]] && zmodload -i zsh/complist
					zle -C "$func" ".$1" "$func"
				fi
				shift
				for i
				do
					if [[ -n $new ]]
					then
						bindkey "$i" | IFS=$' \t' read -A opt
						[[ $opt[-1] = undefined-key ]] || continue
					fi
					bindkey "$i" "$func"
				done ;;
			(*) while (( $# ))
				do
					if [[ "$1" = -N ]]
					then
						type=normal 
					elif [[ "$1" = -p ]]
					then
						type=pattern 
					elif [[ "$1" = -P ]]
					then
						type=postpattern 
					else
						case "$type" in
							(pattern) if [[ $1 = (#b)(*)=(*) ]]
								then
									_patcomps[$match[1]]="=$match[2]=$func" 
								else
									_patcomps[$1]="$func" 
								fi ;;
							(postpattern) if [[ $1 = (#b)(*)=(*) ]]
								then
									_postpatcomps[$match[1]]="=$match[2]=$func" 
								else
									_postpatcomps[$1]="$func" 
								fi ;;
							(*) if [[ "$1" = *\=* ]]
								then
									cmd="${1%%\=*}" 
									svc=yes 
								else
									cmd="$1" 
									svc= 
								fi
								if [[ -z "$new" || -z "${_comps[$1]}" ]]
								then
									_comps[$cmd]="$func" 
									[[ -n "$svc" ]] && _services[$cmd]="${1#*\=}" 
								fi ;;
						esac
					fi
					shift
				done ;;
		esac
	else
		case "$type" in
			(pattern) unset "_patcomps[$^@]" ;;
			(postpattern) unset "_postpatcomps[$^@]" ;;
			(key) print -u2 "$0: cannot restore key bindings"
				return 1 ;;
			(*) unset "_comps[$^@]" ;;
		esac
	fi
}
compdump () {
	# undefined
	builtin autoload -XUz
}
compgen () {
	local opts prefix suffix job OPTARG OPTIND ret=1 
	local -a name res results jids
	local -A shortopts
	emulate -L sh
	setopt kshglob noshglob braceexpand nokshautoload
	shortopts=(a alias b builtin c command d directory e export f file g group j job k keyword u user v variable) 
	while getopts "o:A:G:C:F:P:S:W:X:abcdefgjkuv" name
	do
		case $name in
			([abcdefgjkuv]) OPTARG="${shortopts[$name]}"  ;&
			(A) case $OPTARG in
					(alias) results+=("${(k)aliases[@]}")  ;;
					(arrayvar) results+=("${(k@)parameters[(R)array*]}")  ;;
					(binding) results+=("${(k)widgets[@]}")  ;;
					(builtin) results+=("${(k)builtins[@]}" "${(k)dis_builtins[@]}")  ;;
					(command) results+=("${(k)commands[@]}" "${(k)aliases[@]}" "${(k)builtins[@]}" "${(k)functions[@]}" "${(k)reswords[@]}")  ;;
					(directory) setopt bareglobqual
						results+=(${IPREFIX}${PREFIX}*${SUFFIX}${ISUFFIX}(N-/)) 
						setopt nobareglobqual ;;
					(disabled) results+=("${(k)dis_builtins[@]}")  ;;
					(enabled) results+=("${(k)builtins[@]}")  ;;
					(export) results+=("${(k)parameters[(R)*export*]}")  ;;
					(file) setopt bareglobqual
						results+=(${IPREFIX}${PREFIX}*${SUFFIX}${ISUFFIX}(N)) 
						setopt nobareglobqual ;;
					(function) results+=("${(k)functions[@]}")  ;;
					(group) emulate zsh
						_groups -U -O res
						emulate sh
						setopt kshglob noshglob braceexpand
						results+=("${res[@]}")  ;;
					(hostname) emulate zsh
						_hosts -U -O res
						emulate sh
						setopt kshglob noshglob braceexpand
						results+=("${res[@]}")  ;;
					(job) results+=("${savejobtexts[@]%% *}")  ;;
					(keyword) results+=("${(k)reswords[@]}")  ;;
					(running) jids=("${(@k)savejobstates[(R)running*]}") 
						for job in "${jids[@]}"
						do
							results+=(${savejobtexts[$job]%% *}) 
						done ;;
					(stopped) jids=("${(@k)savejobstates[(R)suspended*]}") 
						for job in "${jids[@]}"
						do
							results+=(${savejobtexts[$job]%% *}) 
						done ;;
					(setopt | shopt) results+=("${(k)options[@]}")  ;;
					(signal) results+=("SIG${^signals[@]}")  ;;
					(user) results+=("${(k)userdirs[@]}")  ;;
					(variable) results+=("${(k)parameters[@]}")  ;;
					(helptopic)  ;;
				esac ;;
			(F) COMPREPLY=() 
				local -a args
				args=("${words[0]}" "${@[-1]}" "${words[CURRENT-2]}") 
				() {
					typeset -h words
					$OPTARG "${args[@]}"
				}
				results+=("${COMPREPLY[@]}")  ;;
			(G) setopt nullglob
				results+=(${~OPTARG}) 
				unsetopt nullglob ;;
			(W) results+=(${(Q)~=OPTARG})  ;;
			(C) results+=($(eval $OPTARG))  ;;
			(P) prefix="$OPTARG"  ;;
			(S) suffix="$OPTARG"  ;;
			(X) if [[ ${OPTARG[0]} = '!' ]]
				then
					results=("${(M)results[@]:#${OPTARG#?}}") 
				else
					results=("${results[@]:#$OPTARG}") 
				fi ;;
		esac
	done
	print -l -r -- "$prefix${^results[@]}$suffix"
}
compinit () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion
}
compinstall () {
	# undefined
	builtin autoload -XUz /usr/share/zsh/functions/Completion
}
complete () {
	emulate -L zsh
	local args void cmd print remove
	args=("$@") 
	zparseopts -D -a void o: A: G: W: C: F: P: S: X: a b c d e f g j k u v p=print r=remove
	if [[ -n $print ]]
	then
		printf 'complete %2$s %1$s\n' "${(@kv)_comps[(R)_bash*]#* }"
	elif [[ -n $remove ]]
	then
		for cmd
		do
			unset "_comps[$cmd]"
		done
	else
		compdef _bash_complete\ ${(j. .)${(q)args[1,-1-$#]}} "$@"
	fi
}
config () {
	pushd ~/.config
	nvim $(fd -tf -H | fzf --layout reverse --border --border-label='Configurations' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
cookbook () {
	pushd ~/Programs/rust-cookbook/
	mdbook serve --open &
	disown
	sleep 1s
	lynx -cfg=/home/n0ko/.config/lynx/lynx.cfg localhost:3000
}
cordon () {
	kubectl cordon $(kubectl get node | awk '{print $0}' | sort -k4nr | flist "Cordon Nodes" | awk '{print $1};')
}
cri () {
	pushd ~/programming/rust || exit 1
	cargo init "$@" && pushd "$@" && nvim $(fd -e rs)
}
dbuild () {
	docker build -t n0ko/$1 -f Dockerfile .
}
dcn () {
	docker network inspect bridge -f '{{ .Containers }}'
}
dcurl () {
	curl http://localhost:$1
}
dic () {
	docker inspect $1 | rg Mount -A 10
}
dipa () {
	docker inspect -f '{{ .NetworkSettings.IPAddress }}' $1
}
dmount () {
	docker run -d --name $1 --mount source=$2,destination=$3
}
dmountsize () {
	docker run -d --name $1 --mount source=$2,$2-size=$3,destination=$4
}
dname () {
	docker run -dit --name $1 $2
}
dnlp-design-sandoxnlp-design-sandoxeletegroup () {
	aws iam delete-group --group-name $@
}
dport () {
	docker run -dit --name $1 -p $2 $3
}
dpush () {
	docker push n0ko/$1
}
drain () {
	kubectl drain --delete-emptydir-data --ignore-daemonsets $(kubectl get node | awk '{print $0}' | sort -k4nr | flist "Cordon Nodes" | awk '{print $1};')
}
dserv () {
	docker service create --name $1 -p $2 $3
}
dshell () {
	docker run -it --name $1 $2 $3
}
dstart () {
	docker restart $1
}
dtest () {
	pidof dunst && killall dunst
	dunst &
	dunstify -u low "hi"
}
ec2 () {
	aws ec2 describe-instances | rg -B110 -i $1
}
ec2ip () {
	aws ec2 describe-instances | rg -B110 -i $1 | rg -i ip
}
edit-command-line () {
	# undefined
	builtin autoload -XU
}
exconf () {
	nvim ~/.zsh/exports/$(cd ~/.zsh/exports && fd -tf |\
        fzf --layout reverse --border --border-label='Export Configurations' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
f () {
	fzf --layout reverse --preview 'bat --style=numbers --color=always --line-range :500 {}'
}
flist () {
	ARG="$@" 
	fzf --layout reverse --border --border-label="$ARG" --preview 'bat --style=numbers --color=always --line-range :500 {}'
}
flisty () {
	ARG=$@ 
	fzf --reverse --border --border-label="$ARG"
}
fzf-cd-widget () {
	local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune     -o -type d -print 2> /dev/null | cut -b3-"}" 
	setopt localoptions pipefail no_aliases 2> /dev/null
	local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --scheme=path --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_ALT_C_OPTS-}" $(__fzfcmd) +m)" 
	if [[ -z "$dir" ]]
	then
		zle redisplay
		return 0
	fi
	zle push-line
	BUFFER="builtin cd -- ${(q)dir}" 
	zle accept-line
	local ret=$? 
	unset dir
	zle reset-prompt
	return $ret
}
fzf-completion () {
	local tokens cmd prefix trigger tail matches lbuf d_cmds
	setopt localoptions noshwordsplit noksh_arrays noposixbuiltins
	tokens=(${(z)LBUFFER}) 
	if [ ${#tokens} -lt 1 ]
	then
		zle ${fzf_default_completion:-expand-or-complete}
		return
	fi
	cmd=$(__fzf_extract_command "$LBUFFER") 
	trigger=${FZF_COMPLETION_TRIGGER-'**'} 
	[ -z "$trigger" -a ${LBUFFER[-1]} = ' ' ] && tokens+=("") 
	if [[ ${LBUFFER} = *"${tokens[-2]-}${tokens[-1]}" ]]
	then
		tokens[-2]="${tokens[-2]-}${tokens[-1]}" 
		tokens=(${tokens[0,-2]}) 
	fi
	lbuf=$LBUFFER 
	tail=${LBUFFER:$(( ${#LBUFFER} - ${#trigger} ))} 
	if [ ${#tokens} -gt 1 -a "$tail" = "$trigger" ]
	then
		d_cmds=(${=FZF_COMPLETION_DIR_COMMANDS:-cd pushd rmdir}) 
		[ -z "$trigger" ] && prefix=${tokens[-1]}  || prefix=${tokens[-1]:0:-${#trigger}} 
		if [[ $prefix = *'$('* ]] || [[ $prefix = *'<('* ]] || [[ $prefix = *'>('* ]] || [[ $prefix = *':='* ]] || [[ $prefix = *'`'* ]]
		then
			return
		fi
		[ -n "${tokens[-1]}" ] && lbuf=${lbuf:0:-${#tokens[-1]}} 
		if eval "type _fzf_complete_${cmd} > /dev/null"
		then
			prefix="$prefix" eval _fzf_complete_${cmd} ${(q)lbuf}
			zle reset-prompt
		elif [ ${d_cmds[(i)$cmd]} -le ${#d_cmds} ]
		then
			_fzf_dir_completion "$prefix" "$lbuf"
		else
			_fzf_path_completion "$prefix" "$lbuf"
		fi
	else
		zle ${fzf_default_completion:-expand-or-complete}
	fi
}
fzf-file-widget () {
	LBUFFER="${LBUFFER}$(__fsel)" 
	local ret=$? 
	zle reset-prompt
	return $ret
}
fzf-history-widget () {
	local selected num
	setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
	selected=($(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} ${FZF_DEFAULT_OPTS-} -n2..,.. --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore ${FZF_CTRL_R_OPTS-} --query=${(qqq)LBUFFER} +m" $(__fzfcmd))) 
	local ret=$? 
	if [ -n "$selected" ]
	then
		num=$selected[1] 
		if [ -n "$num" ]
		then
			zle vi-fetch-history -n $num
		fi
	fi
	zle reset-prompt
	return $ret
}
g1 () {
	go run $1 | column
}
gcco () {
	git checkout $(git branch -al | flisty 'GIT CHECKOUT')
}
gcct () {
	git checkout $(git tag -l | flisty "Git Tags")
}
gcj () {
	gcloud config set account chrismontgomeryjr@gmail.com
	echo "chrismontgomeryjr@gmail.com"
}
gcl () {
	gcloud $@
}
gcm () {
	gcloud config set account cmonty614@gmail.com
	echo "cmonty614@gmail.com"
}
gco () {
	git checkout -b $1
}
gdel () {
	git branch -D $(git branch | $(flisty "Delete Branch"))
}
get-source () {
	asp export $1 && pushd $1 && makepkg -do --skippgpcheck && pushd src
}
gmi () {
	go mod init github/Nokodoko/$1
}
go_test () {
	go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'
}
gpush () {
	git push --set-upstream origin $1
}
grcP () {
	gh repo create $1 --private --clone
}
grcp () {
	gh repo create $1 --public --clone
}
gremote () {
	git remote add origin git@github.com:Nokodoko/$1.git
}
gs () {
	du -a | rg $1(^"test.go") | fzf | xargs -r $EDITOR
}
hadd () {
	helm repo add $1 $2
}
hget () {
	helm get -n $(cat ~/helmInfo/helmSpeed.md | awk {'print $2, $1'} | fzf --layout reverse --border --border-label 'Helm Releases')
}
hhist () {
	helm history -n $(cat ~/helmInfo/helmSpeed.md | awk {'print $2, $1'} | fzf --layout reverse --border --border-label 'Helm Releases')
}
hls () {
	bat ~/helmInfo/helmSpeed.md
}
hlss () {
	bat ~/helmInfo/servSpeed.md
}
hstat () {
	helm status -n $(cat ~/helmInfo/helmSpeed.md | awk {'print $2, $1'} | fzf --layout reverse --border --border-label 'Helm Releases')
}
hstats () {
	helm status -n $(cat ~/helmInfo/servSpeed.md | awk {'print $2, $1'} | fzf --layout reverse)
}
htemp () {
	helm template $(hls | awk '{print $1}' | fzf --layout reverse)
}
hu () {
	helm uninstall $(helm ls | awk '{print $1, $2}' |fzf --layout reverse)
}
hup () {
	helm secrets upgrade --install --namespace $(cat ~/helmInfo/helmUpdate.md | fzf --layout reverse | awk '{print $2, $1}') . -f $@
}
hups () {
	helm secrets upgrade --install --namespace $(cat ~/helmInfo/servSpeed.md | fzf --layout reverse | awk '{print $2, $1}') . -f $@
}
insid () {
	aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId" | rg -i i | sed 's/"//g' | sed 's/,//' | rg c | sed -n ${1}p
}
insidc () {
	awsc ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId" | rg -i i | sed 's/"//g' | sed 's/,//' | rg c | sed -n ${1}p
}
is-at-least () {
	emulate -L zsh
	local IFS=".-" min_cnt=0 ver_cnt=0 part min_ver version order 
	min_ver=(${=1}) 
	version=(${=2:-$ZSH_VERSION} 0) 
	while (( $min_cnt <= ${#min_ver} ))
	do
		while [[ "$part" != <-> ]]
		do
			(( ++ver_cnt > ${#version} )) && return 0
			if [[ ${version[ver_cnt]} = *[0-9][^0-9]* ]]
			then
				order=(${version[ver_cnt]} ${min_ver[ver_cnt]}) 
				if [[ ${version[ver_cnt]} = <->* ]]
				then
					[[ $order != ${${(On)order}} ]] && return 1
				else
					[[ $order != ${${(O)order}} ]] && return 1
				fi
				[[ $order[1] != $order[2] ]] && return 0
			fi
			part=${version[ver_cnt]##*[^0-9]} 
		done
		while true
		do
			(( ++min_cnt > ${#min_ver} )) && return 0
			[[ ${min_ver[min_cnt]} = <-> ]] && break
		done
		(( part > min_ver[min_cnt] )) && return 0
		(( part < min_ver[min_cnt] )) && return 1
		part='' 
	done
}
iwd () {
	sudo iwctl station wlan0 $@
}
iwdb () {
	sudo iwctl $@
}
j () {
	sudo journalctl -u $@
}
jf () {
	sudo journalctl -u $@ -f
}
jirah () {
	bat ~/.zsh/tooling/jira.zsh | rg jira
}
kconf () {
	kubeconform -kubernetes-version $1
}
kdep () {
	kubectl deprications --k8s-version v"$@"
}
key () {
	screenkey $1 &
	disown screenkey
}
kggj () {
	kubectl get jobs -A -o wide | rg -i $1
}
kggn () {
	kubectl get nodes | rg -i $1
}
kggp () {
	kubectl get pods -A | rg -i $1
}
kgnl () {
	kubectl get nodes -l type=$1
}
kjd () {
	kubectl delete job -n $(k get jobs -A | fzf | awk '{print $1, $2}')
}
kk () {
	kubectl krew $@
}
kki () {
	kubectl krew install $(kubectl krew search | fzf --reverse | awk '{print $1}')
}
kpf () {
	kubectl port-forward $1 $2
}
ladd () {
	sudo luarocks install $1
}
laddl () {
	sudo luarocks --tree=./ install $1
}
ldf () {
	c $1
	colorls --git-status
}
lewd () {
	pushd ~/programramming/lua_projects/
}
listgroups () {
	aws iam list-groups
}
lp () {
	cl ~/programming/lua_projects/
}
lremove () {
	sudo luarocks remove $1
}
lrock () {
	pushd /usr/lib/luarocks/rocks-5.4/
}
lsami () {
	aws$1 ec2 describe-instances | rg -i imageid | cut -d: -f2 | sed 's/"//g' | sed 's/,//'
}
lsf () {
	fzf | xargs mplayer
}
lshow () {
	luarocks show $1
}
luap () {
	pushd /home/n0ko/programming/lua_projects/
	nvim $(fd -e lua | flist 'Lua Programs')
}
m () {
	mpv $1 &
	disown mpv
}
man () {
	/usr/bin/man $* | col -b | nvim -R -c 'set ft=man nomod nolist' -
}
mi () {
	mpv --vf=sub,lavfi="negate" $1 &
	disown mpv
}
mkc () {
	mkdir -p $1
	cd $1
}
mkn () {
	mknod /dev/$1 $2 $3 $4
	cd $1
}
mnt () {
	sudo mount $@ /mnt
}
mounta () {
	sudo mount /dev/sda3 /mnt && sudo mount /dev/sda4 /mnt/home && sudo mount /dev/sda1 /mnt/boot && sudo arch-chroot /mnt
}
mounty () {
	sudo mount /dev/sdc3 /mnt && sudo mount /dev/sdc4 /mnt/home && sudo mount /dev/sdc1 /mnt/boot && sudo arch-chroot /mnt
}
move () {
	back $@ &
	disown back
}
net () {
	pushd ~/.zsh/networking/
	vf
}
nsx () {
	nsxiv $@ &
	disown nsxiv
}
os () {
	sudo n -O $1
}
output () {
	nmap -oN $1 $2
}
p () {
	kitty +kitten icat $@
}
plug () {
	pushd ~/.local/share/nvim/lazy/ && c $(fd -td -d1 |fzf --layout reverse --border --border-label='Neovim Plugins' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
podWatch () {
	kubectl get pods -A --watch | egrep -v "1/1|2/2|3/3|4/4|5/5|6/6|Completed"
}
pro () {
	protoc -I ${PWD} --go_out=. $1
}
program () {
	pushd ~/Programs
	cd $(fd -td -d1 | fzf --layout reverse --border --border-label='programrams' --preview 'bat --style=numbers --color=always --line-range :500 {}')
	CURSOR=$#BUFFER 
	zle accept-line 2> /dev/null
}
prompt_starship_precmd () {
	STARSHIP_CMD_STATUS=$? STARSHIP_PIPE_STATUS=(${pipestatus[@]}) 
	if (( ${+STARSHIP_START_TIME} ))
	then
		__starship_get_time && (( STARSHIP_DURATION = STARSHIP_CAPTURED_TIME - STARSHIP_START_TIME ))
		unset STARSHIP_START_TIME
	else
		unset STARSHIP_DURATION
	fi
	STARSHIP_JOBS_COUNT=${#jobstates} 
}
prompt_starship_preexec () {
	__starship_get_time && STARSHIP_START_TIME=$STARSHIP_CAPTURED_TIME 
}
pw () {
	bat ~/.pass/pass.md | rg -i -A 2 $1 | sed -n 2p | xclip -sel c
}
pyenv () {
	local command
	command="${1:-}" 
	if [ "$#" -gt 0 ]
	then
		shift
	fi
	case "$command" in
		(rehash | shell) eval "$(pyenv "sh-$command" "$@")" ;;
		(*) command pyenv "$command" "$@" ;;
	esac
}
pyinstall () {
	pip install $1 --break-system-packages
}
removeuser () {
	aws iam remove-user-from-group --group-name $1 --user-name $2
}
removeuserh () {
	echo "group-name, user-name"
}
rev () {
	c /var/cache/pacman/pkg/
}
rollback () {
	sudo pacman -U $1
}
rstartdhcp () {
	sudo systemctl restart dhcpcd
}
rusty () {
	pushd ~/programming/rusticean
	nvim $(fd -e rs | flist "RUSTY")
}
sb () {
	bat ~/.zshenv > ~/.zsh/tooling/zshenv
	source ~/.zshenv
}
scan () {
	nmap $1 scanme.nmap.org
}
shky () {
	tshark -Y $@
}
spell () {
	pushd ~/scripts
	nvim $(fd -tf | flist 'Spells')
}
starship_zle-keymap-select () {
	zle reset-prompt
}
startec2 () {
	awsc ec2 start-instances --instance-ids $(insidc $@)
}
stopec2 () {
	awsc ec2 stop-instances --instance-ids $(insidc $@)
}
sweep () {
	nmap -sP -oG $1 $2
}
sys_r () {
	sudo systemctl reload $1
}
sysl () {
	sudo systemctl list-dependencies multi-user.target
}
syst () {
	systemctl list-unit-files --type=target
}
tfat () {
	TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform apply -auto-approve -target=$1
}
tfdt () {
	TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform destroy -auto-approve -target=$1
}
tfpt () {
	TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan -target=$1
}
tfpv () {
	TF_LOG=DEBUG OCI_GO_SDK_DEBUG=v terraform plan -lock=false -var-file $1
}
ud () {
	~/Programs/udemy-dl/bin/udemy-dl-linux $1
}
ud2 () {
	python ~/Programs/udemy-dl/udemy-dl.py $1 -k ~/Programs/udemy-dl/cookie2.txt
}
vagb () {
	vagrant box add $1
}
vconf () {
	pushd ~/.config/nvim
	nvim $(fd -e lua . | f --border --border-labels='Neovim Configurations')
}
vf () {
	nvim $(flist $( basename $( pwd )))
}
vfd () {
	nvim $(fd -tf $1)
}
wallpaper () {
	feh --bg-scale $1
}
z () {
	zathura $1 &
	disown zathura
}
za () {
	zellij attach $(zl | flisty 'Zellij Sessions')
}
zconf () {
	nvim ~/.zsh/tooling/$(cd ~/.zsh/tooling && fd -tf |\
        fzf --layout reverse --border --border-label='Zsh Configurations' --preview 'bat --style=numbers --color=always --line-range :500 {}')
}
zks () {
	zellij kill-session $1
}
_zsh_autosuggest_bound_1_accept-and-hold () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-and-hold $@
}
_zsh_autosuggest_bound_1_accept-and-infer-next-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-and-infer-next-history $@
}
_zsh_autosuggest_bound_1_accept-and-menu-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-and-menu-complete $@
}
_zsh_autosuggest_bound_1_accept-line () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-accept-line $@
}
_zsh_autosuggest_bound_1_accept-line-and-down-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-line-and-down-history $@
}
_zsh_autosuggest_bound_1_accept-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-accept-search $@
}
_zsh_autosuggest_bound_1_apps () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-apps $@
}
_zsh_autosuggest_bound_1_argument-base () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-argument-base $@
}
_zsh_autosuggest_bound_1_auto-suffix-remove () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-auto-suffix-remove $@
}
_zsh_autosuggest_bound_1_auto-suffix-retain () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-auto-suffix-retain $@
}
_zsh_autosuggest_bound_1_autosuggest-capture-completion () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-autosuggest-capture-completion $@
}
_zsh_autosuggest_bound_1_backward-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-char $@
}
_zsh_autosuggest_bound_1_backward-delete-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-delete-char $@
}
_zsh_autosuggest_bound_1_backward-delete-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-delete-word $@
}
_zsh_autosuggest_bound_1_backward-kill-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-kill-line $@
}
_zsh_autosuggest_bound_1_backward-kill-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-kill-word $@
}
_zsh_autosuggest_bound_1_backward-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-backward-word $@
}
_zsh_autosuggest_bound_1_beginning-of-buffer-or-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-beginning-of-buffer-or-history $@
}
_zsh_autosuggest_bound_1_beginning-of-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-beginning-of-history $@
}
_zsh_autosuggest_bound_1_beginning-of-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-beginning-of-line $@
}
_zsh_autosuggest_bound_1_beginning-of-line-hist () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-beginning-of-line-hist $@
}
_zsh_autosuggest_bound_1_bracketed-paste () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-bracketed-paste $@
}
_zsh_autosuggest_bound_1_capitalize-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-capitalize-word $@
}
_zsh_autosuggest_bound_1_clear-screen () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-clear-screen $@
}
_zsh_autosuggest_bound_1_complete-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-complete-word $@
}
_zsh_autosuggest_bound_1_config () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-config $@
}
_zsh_autosuggest_bound_1_copy-prev-shell-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-copy-prev-shell-word $@
}
_zsh_autosuggest_bound_1_copy-prev-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-copy-prev-word $@
}
_zsh_autosuggest_bound_1_copy-region-as-kill () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-copy-region-as-kill $@
}
_zsh_autosuggest_bound_1_deactivate-region () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-deactivate-region $@
}
_zsh_autosuggest_bound_1_delete-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-delete-char $@
}
_zsh_autosuggest_bound_1_delete-char-or-list () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-delete-char-or-list $@
}
_zsh_autosuggest_bound_1_delete-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-delete-word $@
}
_zsh_autosuggest_bound_1_describe-key-briefly () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-describe-key-briefly $@
}
_zsh_autosuggest_bound_1_digit-argument () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-digit-argument $@
}
_zsh_autosuggest_bound_1_down-case-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-down-case-word $@
}
_zsh_autosuggest_bound_1_down-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-down-history $@
}
_zsh_autosuggest_bound_1_down-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-down-line $@
}
_zsh_autosuggest_bound_1_down-line-or-history () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-down-line-or-history $@
}
_zsh_autosuggest_bound_1_down-line-or-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-down-line-or-search $@
}
_zsh_autosuggest_bound_1_edit-command-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-edit-command-line $@
}
_zsh_autosuggest_bound_1_emacs-backward-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-emacs-backward-word $@
}
_zsh_autosuggest_bound_1_emacs-forward-word () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-emacs-forward-word $@
}
_zsh_autosuggest_bound_1_end-of-buffer-or-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-end-of-buffer-or-history $@
}
_zsh_autosuggest_bound_1_end-of-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-end-of-history $@
}
_zsh_autosuggest_bound_1_end-of-line () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-end-of-line $@
}
_zsh_autosuggest_bound_1_end-of-line-hist () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-end-of-line-hist $@
}
_zsh_autosuggest_bound_1_end-of-list () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-end-of-list $@
}
_zsh_autosuggest_bound_1_exchange-point-and-mark () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-exchange-point-and-mark $@
}
_zsh_autosuggest_bound_1_exconf () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-exconf $@
}
_zsh_autosuggest_bound_1_execute-last-named-cmd () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-execute-last-named-cmd $@
}
_zsh_autosuggest_bound_1_execute-named-cmd () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-execute-named-cmd $@
}
_zsh_autosuggest_bound_1_expand-cmd-path () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-cmd-path $@
}
_zsh_autosuggest_bound_1_expand-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-history $@
}
_zsh_autosuggest_bound_1_expand-or-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-or-complete $@
}
_zsh_autosuggest_bound_1_expand-or-complete-prefix () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-or-complete-prefix $@
}
_zsh_autosuggest_bound_1_expand-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-expand-word $@
}
_zsh_autosuggest_bound_1_forward-char () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-forward-char $@
}
_zsh_autosuggest_bound_1_forward-word () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-forward-word $@
}
_zsh_autosuggest_bound_1_fzf-cd-widget () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-fzf-cd-widget $@
}
_zsh_autosuggest_bound_1_fzf-completion () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-fzf-completion $@
}
_zsh_autosuggest_bound_1_fzf-file-widget () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-fzf-file-widget $@
}
_zsh_autosuggest_bound_1_fzf-history-widget () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-fzf-history-widget $@
}
_zsh_autosuggest_bound_1_get-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-get-line $@
}
_zsh_autosuggest_bound_1_gosmacs-transpose-chars () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-gosmacs-transpose-chars $@
}
_zsh_autosuggest_bound_1_history-beginning-search-backward () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-history-beginning-search-backward $@
}
_zsh_autosuggest_bound_1_history-beginning-search-forward () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-history-beginning-search-forward $@
}
_zsh_autosuggest_bound_1_history-incremental-pattern-search-backward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-history-incremental-pattern-search-backward $@
}
_zsh_autosuggest_bound_1_history-incremental-pattern-search-forward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-history-incremental-pattern-search-forward $@
}
_zsh_autosuggest_bound_1_history-incremental-search-backward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-history-incremental-search-backward $@
}
_zsh_autosuggest_bound_1_history-incremental-search-forward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-history-incremental-search-forward $@
}
_zsh_autosuggest_bound_1_history-search-backward () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-history-search-backward $@
}
_zsh_autosuggest_bound_1_history-search-forward () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-history-search-forward $@
}
_zsh_autosuggest_bound_1_infer-next-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-infer-next-history $@
}
_zsh_autosuggest_bound_1_insert-last-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-insert-last-word $@
}
_zsh_autosuggest_bound_1_kill-buffer () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-buffer $@
}
_zsh_autosuggest_bound_1_kill-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-line $@
}
_zsh_autosuggest_bound_1_kill-region () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-region $@
}
_zsh_autosuggest_bound_1_kill-whole-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-whole-line $@
}
_zsh_autosuggest_bound_1_kill-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-kill-word $@
}
_zsh_autosuggest_bound_1_lewd () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-lewd $@
}
_zsh_autosuggest_bound_1_list-choices () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-list-choices $@
}
_zsh_autosuggest_bound_1_list-expand () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-list-expand $@
}
_zsh_autosuggest_bound_1_lrock () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-lrock $@
}
_zsh_autosuggest_bound_1_luap () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-luap $@
}
_zsh_autosuggest_bound_1_magic-space () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-magic-space $@
}
_zsh_autosuggest_bound_1_menu-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-menu-complete $@
}
_zsh_autosuggest_bound_1_menu-expand-or-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-menu-expand-or-complete $@
}
_zsh_autosuggest_bound_1_neg-argument () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-neg-argument $@
}
_zsh_autosuggest_bound_1_overwrite-mode () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-overwrite-mode $@
}
_zsh_autosuggest_bound_1_plug () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-plug $@
}
_zsh_autosuggest_bound_1_pound-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-pound-insert $@
}
_zsh_autosuggest_bound_1_program () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-program $@
}
_zsh_autosuggest_bound_1_push-input () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-push-input $@
}
_zsh_autosuggest_bound_1_push-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-push-line $@
}
_zsh_autosuggest_bound_1_push-line-or-edit () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-push-line-or-edit $@
}
_zsh_autosuggest_bound_1_put-replace-selection () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-put-replace-selection $@
}
_zsh_autosuggest_bound_1_quote-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-quote-line $@
}
_zsh_autosuggest_bound_1_quote-region () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-quote-region $@
}
_zsh_autosuggest_bound_1_quoted-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-quoted-insert $@
}
_zsh_autosuggest_bound_1_read-command () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-read-command $@
}
_zsh_autosuggest_bound_1_recursive-edit () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-recursive-edit $@
}
_zsh_autosuggest_bound_1_redisplay () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-redisplay $@
}
_zsh_autosuggest_bound_1_redo () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-redo $@
}
_zsh_autosuggest_bound_1_reset-prompt () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-reset-prompt $@
}
_zsh_autosuggest_bound_1_reverse-menu-complete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-reverse-menu-complete $@
}
_zsh_autosuggest_bound_1_select-a-blank-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-a-blank-word $@
}
_zsh_autosuggest_bound_1_select-a-shell-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-a-shell-word $@
}
_zsh_autosuggest_bound_1_select-a-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-a-word $@
}
_zsh_autosuggest_bound_1_select-in-blank-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-in-blank-word $@
}
_zsh_autosuggest_bound_1_select-in-shell-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-in-shell-word $@
}
_zsh_autosuggest_bound_1_select-in-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-select-in-word $@
}
_zsh_autosuggest_bound_1_self-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-self-insert $@
}
_zsh_autosuggest_bound_1_self-insert-unmeta () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-self-insert-unmeta $@
}
_zsh_autosuggest_bound_1_send-break () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-send-break $@
}
_zsh_autosuggest_bound_1_set-mark-command () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-set-mark-command $@
}
_zsh_autosuggest_bound_1_spell () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-spell $@
}
_zsh_autosuggest_bound_1_spell-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-spell-word $@
}
_zsh_autosuggest_bound_1_split-undo () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-split-undo $@
}
_zsh_autosuggest_bound_1_transpose-chars () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-transpose-chars $@
}
_zsh_autosuggest_bound_1_transpose-words () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-transpose-words $@
}
_zsh_autosuggest_bound_1_undefined-key () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-undefined-key $@
}
_zsh_autosuggest_bound_1_undo () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-undo $@
}
_zsh_autosuggest_bound_1_universal-argument () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-universal-argument $@
}
_zsh_autosuggest_bound_1_up-case-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-up-case-word $@
}
_zsh_autosuggest_bound_1_up-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-up-history $@
}
_zsh_autosuggest_bound_1_up-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-up-line $@
}
_zsh_autosuggest_bound_1_up-line-or-history () {
	_zsh_autosuggest_widget_clear autosuggest-orig-1-up-line-or-history $@
}
_zsh_autosuggest_bound_1_up-line-or-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-up-line-or-search $@
}
_zsh_autosuggest_bound_1_vconf () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vconf $@
}
_zsh_autosuggest_bound_1_vi-add-eol () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-vi-add-eol $@
}
_zsh_autosuggest_bound_1_vi-add-next () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-add-next $@
}
_zsh_autosuggest_bound_1_vi-backward-blank-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-blank-word $@
}
_zsh_autosuggest_bound_1_vi-backward-blank-word-end () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-blank-word-end $@
}
_zsh_autosuggest_bound_1_vi-backward-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-char $@
}
_zsh_autosuggest_bound_1_vi-backward-delete-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-delete-char $@
}
_zsh_autosuggest_bound_1_vi-backward-kill-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-kill-word $@
}
_zsh_autosuggest_bound_1_vi-backward-word () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-word $@
}
_zsh_autosuggest_bound_1_vi-backward-word-end () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-backward-word-end $@
}
_zsh_autosuggest_bound_1_vi-beginning-of-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-beginning-of-line $@
}
_zsh_autosuggest_bound_1_vi-caps-lock-panic () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-caps-lock-panic $@
}
_zsh_autosuggest_bound_1_vi-change () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-change $@
}
_zsh_autosuggest_bound_1_vi-change-eol () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-change-eol $@
}
_zsh_autosuggest_bound_1_vi-change-whole-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-change-whole-line $@
}
_zsh_autosuggest_bound_1_vi-cmd-mode () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-cmd-mode $@
}
_zsh_autosuggest_bound_1_vi-delete () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-delete $@
}
_zsh_autosuggest_bound_1_vi-delete-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-delete-char $@
}
_zsh_autosuggest_bound_1_vi-digit-or-beginning-of-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-digit-or-beginning-of-line $@
}
_zsh_autosuggest_bound_1_vi-down-case () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-down-case $@
}
_zsh_autosuggest_bound_1_vi-down-line-or-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-down-line-or-history $@
}
_zsh_autosuggest_bound_1_vi-end-of-line () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-vi-end-of-line $@
}
_zsh_autosuggest_bound_1_vi-fetch-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-fetch-history $@
}
_zsh_autosuggest_bound_1_vi-find-next-char () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-find-next-char $@
}
_zsh_autosuggest_bound_1_vi-find-next-char-skip () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-find-next-char-skip $@
}
_zsh_autosuggest_bound_1_vi-find-prev-char () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-find-prev-char $@
}
_zsh_autosuggest_bound_1_vi-find-prev-char-skip () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-find-prev-char-skip $@
}
_zsh_autosuggest_bound_1_vi-first-non-blank () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-first-non-blank $@
}
_zsh_autosuggest_bound_1_vi-forward-blank-word () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-forward-blank-word $@
}
_zsh_autosuggest_bound_1_vi-forward-blank-word-end () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-forward-blank-word-end $@
}
_zsh_autosuggest_bound_1_vi-forward-char () {
	_zsh_autosuggest_widget_accept autosuggest-orig-1-vi-forward-char $@
}
_zsh_autosuggest_bound_1_vi-forward-word () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-forward-word $@
}
_zsh_autosuggest_bound_1_vi-forward-word-end () {
	_zsh_autosuggest_widget_partial_accept autosuggest-orig-1-vi-forward-word-end $@
}
_zsh_autosuggest_bound_1_vi-goto-column () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-goto-column $@
}
_zsh_autosuggest_bound_1_vi-goto-mark () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-goto-mark $@
}
_zsh_autosuggest_bound_1_vi-goto-mark-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-goto-mark-line $@
}
_zsh_autosuggest_bound_1_vi-history-search-backward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-history-search-backward $@
}
_zsh_autosuggest_bound_1_vi-history-search-forward () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-history-search-forward $@
}
_zsh_autosuggest_bound_1_vi-indent () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-indent $@
}
_zsh_autosuggest_bound_1_vi-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-insert $@
}
_zsh_autosuggest_bound_1_vi-insert-bol () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-insert-bol $@
}
_zsh_autosuggest_bound_1_vi-join () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-join $@
}
_zsh_autosuggest_bound_1_vi-kill-eol () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-kill-eol $@
}
_zsh_autosuggest_bound_1_vi-kill-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-kill-line $@
}
_zsh_autosuggest_bound_1_vi-match-bracket () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-match-bracket $@
}
_zsh_autosuggest_bound_1_vi-open-line-above () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-open-line-above $@
}
_zsh_autosuggest_bound_1_vi-open-line-below () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-open-line-below $@
}
_zsh_autosuggest_bound_1_vi-oper-swap-case () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-oper-swap-case $@
}
_zsh_autosuggest_bound_1_vi-pound-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-pound-insert $@
}
_zsh_autosuggest_bound_1_vi-put-after () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-put-after $@
}
_zsh_autosuggest_bound_1_vi-put-before () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-put-before $@
}
_zsh_autosuggest_bound_1_vi-quoted-insert () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-quoted-insert $@
}
_zsh_autosuggest_bound_1_vi-repeat-change () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-repeat-change $@
}
_zsh_autosuggest_bound_1_vi-repeat-find () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-repeat-find $@
}
_zsh_autosuggest_bound_1_vi-repeat-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-repeat-search $@
}
_zsh_autosuggest_bound_1_vi-replace () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-replace $@
}
_zsh_autosuggest_bound_1_vi-replace-chars () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-replace-chars $@
}
_zsh_autosuggest_bound_1_vi-rev-repeat-find () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-rev-repeat-find $@
}
_zsh_autosuggest_bound_1_vi-rev-repeat-search () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-rev-repeat-search $@
}
_zsh_autosuggest_bound_1_vi-set-buffer () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-set-buffer $@
}
_zsh_autosuggest_bound_1_vi-set-mark () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-set-mark $@
}
_zsh_autosuggest_bound_1_vi-substitute () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-substitute $@
}
_zsh_autosuggest_bound_1_vi-swap-case () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-swap-case $@
}
_zsh_autosuggest_bound_1_vi-undo-change () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-undo-change $@
}
_zsh_autosuggest_bound_1_vi-unindent () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-unindent $@
}
_zsh_autosuggest_bound_1_vi-up-case () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-up-case $@
}
_zsh_autosuggest_bound_1_vi-up-line-or-history () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-up-line-or-history $@
}
_zsh_autosuggest_bound_1_vi-yank () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-yank $@
}
_zsh_autosuggest_bound_1_vi-yank-eol () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-yank-eol $@
}
_zsh_autosuggest_bound_1_vi-yank-whole-line () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-vi-yank-whole-line $@
}
_zsh_autosuggest_bound_1_visual-line-mode () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-visual-line-mode $@
}
_zsh_autosuggest_bound_1_visual-mode () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-visual-mode $@
}
_zsh_autosuggest_bound_1_what-cursor-position () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-what-cursor-position $@
}
_zsh_autosuggest_bound_1_where-is () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-where-is $@
}
_zsh_autosuggest_bound_1_zconf () {
	_zsh_autosuggest_widget_modify autosuggest-orig-1-zconf $@
}
_zsh_autosuggest_capture_completion_async () {
