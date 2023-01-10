pragma Ada_2012;
package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable
     (g : in Type_Grille; v : Integer; c : Type_Coordonnee) return Boolean
   is
      colonne : Type_Ensemble;
      ligne : Type_Ensemble;
      carre : Type_Ensemble;
      numCarre : Integer;
   begin
      if not caseVide(g,c) then
         raise CASE_NON_VIDE;
      end if;

      colonne:= obtenirChiffresDUneColonne(g,obtenirColonne(c));
      ligne:= obtenirChiffresDUneLigne(g,obtenirLigne(c));
      numCarre := obtenirCarre(c);
      carre:= obtenirChiffresDUnCarre(g,numCarre);

      return not appartientChiffre(colonne,v) and not appartientChiffre(ligne,v) and not appartientChiffre(carre,v);
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
      solutions_possibles : Type_Ensemble;
   begin
      if not caseVide(g,c) then
         raise CASE_NON_VIDE;
      end if;
      solutions_possibles:=construireEnsemble;
      for i in 1..9 loop
         if estChiffreValable(g,i,c) then
            ajouterChiffre(solutions_possibles,i);
         end if;
      end loop;
      return solutions_possibles;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
   begin
      if nombreChiffres(resultats) > 1 then
         raise PLUS_DE_UN_CHIFFRE;
      end if;
      if ensembleVide(resultats) then
         raise ENSEMBLE_VIDE;
      end if;
      for i in 1..9 loop
         if appartientChiffre(resultats,i) then
            return i;
         end if;
      end loop;
   end rechercherSolutionUniqueDansEnsemble;

   --------------------
   -- resoudreSudoku --
   --------------------
   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean; cpt : in out Integer) is
      c : Type_Coordonnee;
      solutions : Type_Ensemble;
      maj : Boolean;
      pile_Coordonnees : Pile;
      backtrack : Integer;
      c2 : Type_Coordonnee;
      ligne : Integer;
      colonne : Integer;
   begin
      cpt := 0;
      trouve:=False;
      while not trouve loop
         maj := False;
         for i in 1..9 loop
            for j in 1..9 loop
               solutions := construireEnsemble;
               c:=construireCoordonnees(i,j);
               if caseVide(g,c) then
                  solutions := obtenirSolutionsPossibles(g,c);
               end if;
               if nombreChiffres(solutions)=1 and then not ensembleVide(solutions) then
                  fixerChiffre(g,c,rechercherSolutionUniqueDansEnsemble(solutions), cpt);
                  maj := True;
               end if;
            end loop;
         end loop;

         -- BACKTRACKING
         pile_Coordonnees := construirePile;
         ligne := 1;
         while ligne <= 9 loop
            colonne := 1;
            while colonne <= 9 loop
               if not maj then
                  solutions := construireEnsemble;
                  c := construireCoordonnees(ligne,colonne);
                  if caseVide(g,c) then
                     solutions := obtenirSolutionsPossibles(g,c);
                     backtrack := 1;
                     if ensembleVide(solutions) and not estVide(pile_Coordonnees) then
                           backtrack := obtenirChiffre(g,dernier(pile_Coordonnees));
                           pile_Coordonnees:=depile(pile_Coordonnees);
                        ligne := obtenirLigne(c);
                        while ligne <= 9 loop
                           colonne := obtenirColonne(c);
                           while colonne <= 9 loop
                              c2 := construireCoordonnees(ligne,colonne);
                              if not caseVide(g,c2) then
                                 viderCase(g,c2);
                              end if;
                              colonne := colonne + 1;
                           end loop;
                           ligne := ligne + 1;
                        end loop;
                        ligne := obtenirLigne(c);
                        colonne := obtenirColonne(c);
                     end if;
                     while backtrack <= 9 and then not appartientChiffre(solutions,backtrack) loop
                        backtrack:=backtrack+1;
                     end loop;
                     pile_Coordonnees:=empile(pile_Coordonnees,c);
                     fixerChiffre(g,c,backtrack,cpt);
                     maj := True;
                  end if;
               end if;
               colonne := colonne + 1;
            end loop;
            ligne := ligne + 1;
         end loop;

         if estRemplie(g) then
            trouve := True;
         end if;
      end loop;
   end resoudreSudoku;

end resolutions;
