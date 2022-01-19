#!/usr/bin/perl
# written by E Meyer, eli.meyer@science.oregonstate.edu
# distributed without any guarantees or restrictions

$scriptname=$0; $scriptname =~ s/.+\///g;
if ($#ARGV != 0 || $ARGV[0] eq "-h") 
	{
	print "\nCalculate genetic distance among samples based on input SNP matrix.\n";
	print "Output: genetic distance as 1-(proportion of shared alleles)\n";
	print "Usage: $scriptname input > output\n"; 
	print "Where:\tinput = a tab delimited genotype matrix output from CombineGenotypes.pl.\n";
	print "\t\tHeterozygous alleles space delimited (e.g. \"A C\"); missing data coded as \"0\"\n";
	print "\t\tRows are loci\n";
	print "\t\tColumn 1 = tag name\n";
	print "\t\tColumn 2 = position in tag\n";
	print "\t\tColumns 3..n = samples\n\n";
	exit;
	}

open(IN,$ARGV[0]);
while(<IN>)
	{
	chomp;
	$rowcount++;
	@cols = split("\t", $_);
	$ncols=@cols;
	if($rowcount==1) {@header=@cols; next;}
	for ($c=2; $c<$ncols; $c++)
		{
		$gh{$cols[0]}{$cols[1]}{$header[$c]} = $cols[$c];
#		print $header[$c], "\t", $cols[0], "\t", $cols[1], "\t", $cols[$c], "\n";
		}
	}
close(IN);


print "\t";
foreach $s (@header[2..$ncols-1])
	{
	print $s, "\t";
	}
print "\n";

foreach $s (@header[2..$ncols-1])
	{
	print $s, "\t";
	foreach $k (@header[2..$ncols-1])
		{
		$bgt = 0; $score = 0; $sim = 0;
		if ($s eq $k) {print "0\t"; next;}
		foreach $tag (sort(keys(%gh)))
			{
			%tagh = %{$gh{$tag}};
			foreach $loc (sort{$a<=>$b}(keys(%tagh)))
				{
				if ($tagh{$loc}{$s} eq 0 || $tagh{$loc}{$k} eq 0)	{next;}
				$bgt++;
				if ($tagh{$loc}{$s} eq $tagh{$loc}{$k})	{$score += 1;}
				elsif	($tagh{$loc}{$s} =~ /$tagh{$loc}{$k}/ || $tagh{$loc}{$k} =~ /$tagh{$loc}{$s}/)
					{$score += 0.5;}
				}
			}
		$sim = int($score / $bgt * 1000)/1000;
		print 1-$sim, "\t";
		}
	print "\n";
	}
