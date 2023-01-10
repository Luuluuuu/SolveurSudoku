-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
-- Résolutions de sudoku
with affichage;     use affichage;
with resolutions;   use resolutions;
with remplirGrille; use remplirGrille;

-------------------------------
-- tests resolution grille 7 --
-------------------------------

procedure test_Resolution_Grille_7 is
   g      : Type_Grille;
   trouve : Boolean;
   cpt : Integer := 0;
begin
   g := grille7Difficile;
   afficherGrille(g);
   resoudreSudoku (g, trouve, cpt);
   if trouve then
      Put_Line ("Grille 7 reussie");
      afficherGrille(g);
   else
      Put_Line ("grille 7 ratee");
   end if;

end test_Resolution_Grille_7;
