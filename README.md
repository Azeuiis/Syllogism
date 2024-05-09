# Syllogism
Un programme qui prend un syllogisme et qui vérifie si celui-ci est valide ou non.
⚠️ Syllogisme valide =/= Syllogisme Correcte.

**Notions et notations :** Un syllogisme est la donnée de trois propositions. Les deux premières sont appelées
prémisses (n°1 et n°2) et la troisième la conclusion (C). Une proposition est de la forme s → p, où et s et p sont appelés
termes, appelés respectivement sujet et prédicat. La conclusion est notée S → P. La prémisse n°1 est composée de P
et d’un terme M, dit moyen. Elle est de la forme P → M ou M → P. La prémisse n°2 est composée de S et du terme M.
Elle est de la forme S → M ou M → S. Les quatre formes de syllogismes, dites figures, sont donc :

|               | Figure 1 | Figure 2 | Figure 3 | Figure 4 |
|:-------------:|:--------:|----------|----------|----------|                       
| 1ere prémisse | M → P    | P → M    | M → P    | P → M    |                       
| 2e prémisse   | S → M    | S → M    | M → S    | M → S    |                       
| Conclusion    | S → P    | S → P    | S → P    | S → P    |

Chaque proposition a une quantité : universelle ou particulière, et une qualité : affirmative ou négative. Il est donc vrai
ou faux que la quantité d’une proposition est universelle et que sa qualité est affirmative. Comme un syllogisme a 3
propositions, il faut 3 × 2 = 6 variables booléennes pour coder leurs qualités et quantités. Dans les prémisses, à la
figure 1, S et P demeurent respectivement sujet et prédicat. Dans les prémisses de la figure 2, P devient sujet. Dans
celles de la figure 3, S devient prédicat. Enfin, dans celles de la figure 4, P devient sujet et S devient prédicat. Il faut
donc une variable booléenne pour coder la fonction de S dans sa proposition, et une autre pour coder la nature de P
dans sa proposition. On caractérise donc un syllogisme de façon complète par 8 variables booléennes (tableau 1).

| Variable |          Vraie quand...         |                       | Proposition | U = vrai | U = faux |
|:--------:|:-------------------------------:|                       |:-----------:|:--------:|----------|
| U1       | la 1re prémisse est universelle |                       | A = vrai    | A        | I        |
| U2       | la 2re prémisse est universelle |                       | A = faux    | E        | O        |
| Uc       | la conclusion est universelle   |
| A1       | la 1re prémisse est affirmative |
| A2       | la 2e prémisse est affirmative  |
| Ac       | la conclusion est affirmative   |
| S        | S est sujet dans sa prémisse    |
| P        | P est prédicat dans sa prémisse |  
