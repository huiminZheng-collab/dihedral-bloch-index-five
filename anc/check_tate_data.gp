/* Exact fixed degree-eight Tate-line generator and seven Chebotarev controls.
   Does not certify the choice of a particular mixed ray or compute Q2.
*/
default(parisize,200000000);
default(realprecision,80);
y;x;
print("PARI_VERSION=",version());
b=bnfinit(polcyclo(20,y),1);n=b.nf;
if(bnfcertify(b)!=1||b.no!=1,error("cyclotomic base is not certified class one"));
g=b.fu[1]*b.fu[2]^3*b.fu[3];
au(a,r)=Mod(subst(lift(a),y,Mod(y^r,n.pol)),n.pol);
ug=bnfisunit(b,g);
us=bnfisunit(b,au(g,13)/g^2);
uc=bnfisunit(b,au(g,19)/g);
if(#ug!=4||#us!=4||#uc!=4,error("incomplete unit coordinate vector"));
if(ug[1]%5!=1||ug[2]%5!=3||ug[3]%5!=1,error("unit generator has different coordinates"));
if(sum(j=1,4,us[j]%5!=0)||sum(j=1,4,uc[j]%5!=0),error("wrong Tate Kummer character"));
print("CERTIFIED_E_DISC=",n.disc," ROOTS_OF_UNITY_ORDER=",b.tu[1]);
print("G2=",lift(g)," UNIT_COORDINATES=",ug);
print("SIGMA13_G2_OVER_G2_SQUARED_COORDINATES=",us," C_G2_OVER_G2_COORDINATES=",uc);
print("NONZERO_TATE_LINE_GENERATOR_ACCEPTED");
f0=x^5+10*x^3-10*x^2-15*x-18;
check(ell)=
{
  my(P=idealprimedec(n,ell),tv,dg,ff,wild);
  if(#P!=8,error("ell not split in E"));
  tv=vector(8,j,lift(nfmodpr(n,g,P[j])^((ell-1)/5)));
  if(sum(j=1,8,tv[j]!=1)&&sum(j=1,8,tv[j]==1),error("Tate splitting is not conjugation stable"));
  ff=factormod(f0,ell);dg=vector(matsize(ff)[1],j,poldegree(ff[j,1]));
  if(dg!=[5]&&dg!=[1,1,1,1,1],error("unexpected pure wild Frobenius splitting"));
  wild=(dg==[5]);
  print("ELL=",ell," TATE_SPLIT=",tv[1]==1," ALL_TATE_RESIDUES=",tv," PURE_WILD_FROB_NONZERO=",wild," PURE_WILD_FACTOR_DEGREES=",dg," IN_DENSITY_ONE_OVER_50_SET=",tv[1]==1&&wild);
};
{for(j=1,7,check([41,701,941,1321,1381,1801,2081][j]));}
print("TATE_DATA_DONE");
quit;
