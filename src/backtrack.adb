
   procedure backtrack (g : in Type_Grille ; gAux : in out Type_Grille; c : in out Type_Coordonnee) is
      cTemp : Type_Coordonnee;
   begin
      -- on vide la case pour pouvoir mettre la nouvelle valeur
      viderCase (gAux, c);
      -- vider toutes les cases suivantes potentiellement erronées
      cTemp := c;
      while not estDernier(cTemp) loop
         if caseVide (g, cTemp) and not caseVide (gAux, cTemp) then
            viderCase (gAux, cTemp);
         end if;
         cTemp := caseSuivante(cTemp);
      end loop;
      -- vidage de la dernière case
      if caseVide (g, cTemp) and not caseVide (gAux, cTemp) then
            viderCase (gAux, cTemp);
       end if;
   end backtrack;
