Config {
    font = "xft:Firacode-Medium  Mono:size=14:antialias=true"
       , additionalFonts = []
       , borderColor = "#FEFEF8"
       , border = TopB
       , bgColor = "#EBEBEB"
       , fgColor = "#292C3E"
       , alpha = 255
       , position = Top
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = True
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run DynNetwork     [ "--template" , "<dev>: <tx>kB/s|<rx>kB/s"
                                         , "--Low"      , "1000"       -- units: B/s
                                         , "--High"     , "5000"       -- units: B/s
                                         , "--low"      , "#A0E521"
                                         , "--normal"   , "#FFC620"
                                         , "--high"     , "#FF301B"
                                         ] 10
                    , Run MultiCpu       [ "--template" , "Cpu: <total>%"
                                         , "--Low"      , "50"
                                         , "--High"     , "85"
                                         , "--low"      , "#A0E521"
                                         , "--normal"   , "#FFC620"
                                         , "--high"     , "#FF301B"
                                         ] 10
                    , Run Memory         [ "--template" ,"Mem: <usedratio>%"
                                         , "--Low"      , "20"
                                         , "--High"     , "90"
                                         , "--low"      , "#A0E521"
                                         , "--normal"   , "#FFC620"
                                         , "--high"     , "#FF301B"
                                         ] 10
                    , Run Date "%a %b %_d, %H:%M:%S" "date" 10
                    , Run Battery        [ "--template" , "Batt: <acstatus>"
                                         , "--Low"      , "15"
                                         , "--High"     , "80"
                                         , "--low"      , "#FF301B"
                                         , "--normal"   , "#FFC620"
                                         , "--high"     , "#A0E521"
                                         , "--"
                                         , "-o"	, "<left>% (<timeleft>)"
                                         , "-O"	, "<fc=#ffc107>Charging</fc>"
                                         , "-i"	, "<fc=#8bc34a>Charged</fc>"
                                         ] 50
                                         , Run StdinReader
                    ]
                                         , sepChar = "%"
                                         , alignSep = "}{"
                                         , template = "%StdinReader% }\
                                             \{ %multicpu% | %memory% | %dynnetwork% | <fc=#292C3E>%date%</fc> | %battery% " }
