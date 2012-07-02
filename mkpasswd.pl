use strict;

my @inp = @ARGV;
my @mkfor;
my %set;

for (my $i = 0;$i <= @inp;$i++){
  if ($inp[$i] =~ /^\-/){
    my $key = $inp[$i];
    $key =~ s/^\-//;
    $set{$key} = $inp[$i + 1];
    $i++;
  }else{
    push @mkfor,$inp[$i];
  }
}

$set{keta} ||= 8;
$set{file} ||= time . '_pass.txt';

local *FILE;
open FILE,">$set{file}";
for my $id (@mkfor){
  next unless $id;
  my $str = mkpass($set{keta});
  print FILE qq|$id\t$str\n|;
  print qq|$id\t$str\n|;
}
close FILE;

sub mkpass {
  my $keta = shift;
  my $str;
  for (my $i = 0; $i < $keta ; $i++) {
    my $w = (1..9,'A'..'Z','a'..'z')[rand 61];
    $w = (1..9,'A'..'Z','a'..'z')[rand 61] while ($str =~ /$w$/);
    $str .= $w;
  }
  $str;
}
