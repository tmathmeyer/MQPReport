COMMENT : \;.*\n -> skip
ID : [a-zA-Z0-9]+

sExpr :
    '(' (ID | sExpr)+ ')'
