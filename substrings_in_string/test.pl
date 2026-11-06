use strict;
use warnings;
use Test::More;
use lib './Modules';
use Solution qw(get_pos);

use constant base => "Version xxxx                                             
  
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
Partial Database   
http://... 
Copyright (c) All rights reserved. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
  
<>

AaaI (XmaIII)                     CGGCCG 
AacI (BamHI)                      GGATCC 
AaeI (BamHI)                      GGATCC 
AagI (ClaI)                       ATCGAT 
AaqI (ApaLI)                      GTGCAC 
AarI                              NNNNNNNNGCAGGTG 
AatI (StuI)                       AGGCCT 
AatII                             GACGTC 
AauI (Bsp1407I)                   TGTACA 
AbaI (BclI)                       TGATCA 
AbeI (BbvCI)                      CCTCAGC 
AbrI (XhoI)                       CTCGAG 
AcaI (AsuII)                      TTCGAA 
AcaII (BamHI)                     GGATCC 
AcaIII (MstI)                     TGCGCA 
AcaIV (HaeIII)                    GGCC 
AccI                              GTMKAC 
AccII (FnuDII)                    CGCG 
AccIII (BspMII)                   TCCGGA 
Acc16I (MstI)                     TGCGCA 
Acc36I (BspMI)                    ACCTGCNNNN 
Acc38I (EcoRII)                   CCWGG 
Acc65I (KpnI)                     GGTACC 
Acc113I (ScaI)                    AGTACT 
AccB1I (HgiCI)                    GGYRCC 
AccB2I (HaeII)                    RGCGCY 
AccB7I (PflMI)                    CCANNNNNTGG 
AccBSI (BsrBI)                    CCGCTC 
AccEBI (BamHI)                    GGATCC 
AceI (TseI)                       GCWGC 
AceII (NheI)                      GCTAGC 
AceIII                            CAGCTCNNNNNNN 
AciI                              CCGC 
AclI                              AACGTT 
AclNI (SpeI)                      ACTAGT 
AclWI (BinI)                      GGATCNNNN";

use constant base1 => "Version yyyy                                             
  
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
Partial Database   
http://... 
Copyright (c) All rights reserved. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
  
<>

BasI (PflMI)                      CCANNNNNTGG
BauI (BsiI)                       CACGAG
BavI (PvuII)                      CAGCTG
BavAI (PvuII)                     CAGCTG
BavAII (AsuI)                     GGNCC
BavBI (PvuII)                     CAGCTG
BavBII (AsuI)                     GGNCC
BavCI (ClaI)                      ATCGAT
BazI (ClaI)                       ATCGAT
Bba179I (BetI)                    WCCGGW
BbeI (NarI)                       GGCGCC
BbeAI (NarI)                      GGCGCC
BbfI (XhoI)                       CTCGAG
Bbf7411I (BspMII)                 TCCGGA
BbiI (PstI)                       CTGCAG
BbiII (AcyI)                      GRCGYC
BbiIII (XhoI)                     CTCGAG
Bbi24I (MluI)                     ACGCGT
BbiDI (PvuRts1I)                  CNNNNNNNNNN
BbrI (HindIII)                    AAGCTT
Bbr7I (BbvII)                     GAAGACNNNNNNN
BbrAI (HindIII)                   AAGCTT
BbrPI (PmaCI)                     CACGTG
BbrUII (SalI)                     GTCGAC
BbrUIII (PstI)                    CTGCAG
BbsI (BbvII)                      GAAGACNN
BbtI (HhaI)                       GCGC
BbuI (SphI)                       GCATGC
BbvI                              GCAGCNNNNNNNN
BbvII                             GAAGACNN
Bbv12I (HgiAI)                    GWGCWC
Bbv16II (BbvII)                   GAAGACNN
BbvAI (XmnI)                      GAANNNNTTC
BbvAII (ClaI)                     ATCGAT";

use constant data =>
"agatggcggcgctgaggggtcttgggggctctaggccggccacctactgg
tttgcagcggagacgacgcatggggcctgcgcaataggagtacgctgcct
gggaggcgtgactagaagcggaagtagttgtgggcgcctttgcaaccgcc
tgggacgccgccgagtggtctgtgcaggttcgcgggtcgctggcgggggt
cgtgagggagtgcgccgggagcggagatatggagggagatggttcagacc
cagagcctccagatgccggggaggacagcaagtccgagaatggggagaat
gcgcccatctactgcatctgccgcaaaccggacatcaactgcttcatgat
cgggtgtgacaactgcaatgagtggttccatggggactgcatccggatca
ctgagaagatggccaaggccatccgggagtggtactgtcgggagtgcaga
gagaaagaccccaagctagagattcgctatcggcacaagaagtcacggga
gcgggatggcaatgagcgggacagcagtgagccccgggatgagggtggag
ggcgcaagaggcctgtccctgatccagacctgcagcgccgggcagggtca
gggacaggggttggggccatgcttgctcggggctctgcttcgccccacaa
atcctctccgcagcccttggtggccacacccagccagcatcaccagcagc
agcagcagcagatcaaacggtcagcccgcatgtgtggtgagtgtgaggca
tgtcggcgcactgaggactgtggtcactgtgatttctgtcgggacatgaa
gaagttcgggggccccaacaagatccggcagaagtgccggctgcgccagt
gccagctgcgggcccgggaatcgtacaagtacttcccttcctcgctctca
ccagtgacgccctcagagtccctgccaaggccccgccggccactgcccac
ccaacagcagccacagccatcacagaagttagggcgcatccgtgaagatg
agggggcagtggcgtcatcaacagtcaaggagcctcctgaggctacagcc
acacctgagccactctcagatgaggaccta";

use constant data1 =>
"agatggcggcgctgaggggtcttgggggctctaggccggccacctactggtttgcagcgg
agacgacgcatggggcctgcgcaataggagtacgctgcctgggaggcgtgactagaagcg
gaagtagttgtgggcgcctttgcaaccgcctgggacgccgccgagtggtctgtgcaggtt
cgcgggtcgctggcgggggtcgtgagggagtgcgccgggagcggagatatggagggagat
ggttcagacccagagcctccagatgccggggaggacagcaagtccgagaatggggagaat
gcgcccatctactgcatctgccgcaaaccggacatcaactgcttcatgatcgggtgtgac
aactgcaatgagtggttccatggggactgcatccggatcactgagaagatggccaaggcc
atccgggagtggtactgtcgggagtgcagagagaaagaccccaagctagagattcgctat
cggcacaagaagtcacgggagcgggatggcaatgagcgggacagcagtgagccccgggat
gagggtggagggcgcaagaggcctgtccctgatccagacctgcagcgccgggcagggtca
gggacaggggttggggccatgcttgctcggggctctgcttcgccccacaaatcctctccg
cagcccttggtggccacacccagccagcatcaccagcagcagcagcagcagatcaaacgg
tcagcccgcatgtgtggtgagtgtgaggcatgtcggcgcactgaggactgtggtcactgt
gatttctgtcgggacatgaagaagttcgggggccccaacaagatccggcagaagtgccgg
ctgcgccagtgccagctgcgggcccgggaatcgtacaagtacttcccttcctcgctctca
ccagtgacgccctcagagtccctgccaaggccccgccggccactgcccacccaacagcag
ccacagccatcacagaagttagggcgcatccgtgaagatgagggggcagtggcgtcatca
acagtcaaggagcctcctgaggctacagccacacctgagccactctcagatgaggaccta
cctctggatcctgacctgtatcaggacttctgtgcaggggcctttgatgaccatggcctg
ccctggatgagcgacacagaagagtccccattcctggaccccgcgctgcggaagagggca
gtgaaagtgaagcatgtgaagcgtcgggagaagaagtctgagaagaagaaggaggagcga
tacaagcggcatcggcagaagcagaagcacaaggataaatggaaacacccagagagggct
gatgccaaggaccctgcgtcactgccccagtgcctggggcccggctgtgtgcgccccgcc
cagcccagctccaagtattgctcagatgactgtggcatgaagctggcagccaaccgcatc
tacgagatcctcccccagcgcatccagcagtggcagcagagcccttgcattgctgaagag
cacggcaagaagctgctcgaacgcattcgccgagagcagcagagtgcccgcactcgcctt
caggaaatggaacgccgattccatgagcttgaggccatcattctacgtgccaagcagcag
gctgtgcgcgaggatgaggagagcaacgagggtgacagtgatgacacagacctgcagatc
ttctgtgtttcctgtgggcaccccatcaacccacgtgttgccttgcgccacatggagcgc
tgctacgccaagtatgagagccagacgtcctttgggtccatgtaccccacacgcattgaa
ggggccacacgactcttctgtgatgtgtataatcctcagagcaaaacatactgtaagcgg
ctccaggtgctgtgccccgagcactcacgggaccccaaagtgccagctgacgaggtatgc
gggtgcccccttgtacgtgatgtctttgagctcacgggtgacttctgccgcctgcccaag
cgccagtgcaatcgccattactgctgggagaagctgcggcgtgcggaagtggacttggag
cgcgtgcgtgtgtggtacaagctggacgagctgtttgagcaggagcgcaatgtgcgcaca
gccatgacaaaccgcgcgggattgctggccctgatgctgcaccagacgatccagcacgat
cccctcactaccgacctgcgctccagtgccgaccgctgagcctcctggcccggacccctt
acaccctgcattccagatgggggagccgcccggtgcccgtgtgtccgttcctccactcat
ctgtttctccggttctccctgtgcccatccaccggttgaccgcccatctgcctttatcag
agggactgtccccgtcgacatgttcagtgcctggtggggctgcggagtccactcatcctt
gcctcctctccctgggttttgttaataaaattttgaagaaaccaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaa";

sub testing_ex_str {
    my ($str, $query, $exp) = @_;
    my $ans = get_pos(base, $str, $query);
    is($ans, $exp, "base, '$str', '$query'; should return $exp ..->.. got $ans");
}
sub testing_ex_data1 {
    my ($str, $query, $exp) = @_;
    my $ans = get_pos(base1, $str, $query);
    is($ans, $exp, "base1, data1, '$query'; should return $exp ..->.. got $ans");
}

subtest "basics_ex_base" => sub {
    my $str = "GCAGCaGCAGCgatggcggcgctgaggggtcttgggggctctaggccggccacctactgg";
    my $sol = "1 7";
    testing_ex_str($str, "AceI", $sol);
=for
    $str = "GCAGCaGCAGCgatggcggcgctgaggggtcttgggggctctaggccggccacctactgg";
    $sol = "AaeI is not in given string";
    testing_ex_str($str, "AaeI", $sol);
    $str = "GCAGCaGCAGCgatggcggcgctgaggggtcttgggggctctaggccggccacctactgg";
    $sol = "This query name does not exist in given Base";
    testing_ex_str($str, "XaeI", $sol);    
=cut
};

=for
subtest "basics_ex_base1_data1" => sub {
    my $sol = "40 1347";
    testing_ex_data1(data1, "BasI", $sol);
};
=cut

done_testing();

