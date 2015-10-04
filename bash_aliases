# Ausgaben von ls immer einfärben
alias ls="ls --color=auto"

# CygWin speziefische Kommandos #
#################################
if type cygstart >/dev/null 2>&1; then
    # 'open' als alias für Cygstart, zum öffnen von beliebigen Dateien
    # oder des Explorers (mit 'open .')
    alias open='cygstart'

    # 'newterm' zum öffnen eines neuen Terminals im gleichen Arbeitsverzeichnis
    alias newterm='cygstart /bin/mintty'
fi

alias todo="vim ~/todo/main.txt"
