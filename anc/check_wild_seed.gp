/* Exact audit of the conductor-25 anti-cyclic degree-five ray layer over Q(i).
   No Q2 conclusion is printed by the computation: the mathematical proof is external.
*/
default(parisize,400000000);
default(realprecision,100);
y;x;
bk=bnfinit(y^2+1,1);nk=bk.nf;
if(bnfcertify(bk)!=1,error("Q(i) certification failed"));
R=bnrinit(bk,25,1);Hs=subgrouplist(R,5,1);cnt=0;
print("PARI_VERSION=",version()," RAY_CYC=",R.cyc," SUBGROUP_COUNT=",#Hs);
audit()=
{
for(j=1,#Hs,
  if(matdet(Hs[j])!=5,next);
  rel=rnfkummer(R,Hs[j]);
  q=polredbest(rnfequation(nk,rel));
  n=nfinit(q);fs=nfsubfields(n,5);
  if(#fs==0,print("SUBGROUP=",j," NO_QUINTIC_SUBFIELD=1");next);
  f=polredabs(fs[1][1]);gg=polgalois(f);
  print("SUBGROUP=",j," QUINTIC=",f," QUINTIC_GALOIS=",gg," M_DISC=",n.disc);
  if(gg[1]==10,
    cnt++;
    if(n.sign!=[0,5]||#nfgaloisconj(n)!=10||n.disc!=-2^10*5^16,error("pure-wild D10 field certificate mismatch"));
    C=rnfconductor(bk,rel,1);
    if(idealhnf(nk,C[1][1])!=idealhnf(nk,25),error("pure-wild relative conductor mismatch"));
    P=idealprimedec(n,5);
    if(#P!=2,error("pure-wild five-prime count"));
    for(k=1,#P,if(P[k].e!=5||P[k].f!=1,error("pure-wild five e/f mismatch")));
    print("PURE_WILD_D10_POL=",q," F1_POL=",f," F1_DISC=",nfdisc(f)," CONDUCTOR=",C[1]," PRIME5_EF=",vector(#P,k,[P[k].e,P[k].f]));
    print("PURE_WILD_ARITHMETIC_CERTIFICATE_ACCEPTED");
  );
);
if(cnt!=1,error("anti-cyclic conductor-25 layer not unique"));
print("PURE_WILD_D10_COUNT=",cnt);
print("WILD_SEED_DONE");
};
audit();
quit;
