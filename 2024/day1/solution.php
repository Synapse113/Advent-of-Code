<?php
$input = file_get_contents('input.txt');
$list1 = [];
$list2 = [];
$total_distance = 0;
$similarity_score = 0;

$processed_input = explode(PHP_EOL, trim(preg_replace('/ +/', ',', $input)));

foreach ($processed_input as $row) {
	$split = explode(',', $row);

	$list2[] = array_pop($split);
	$list1[] = array_pop($split);
}

sort($list1);
sort($list2);

foreach ($list1 as $i => $value) {
	$similarity_score += (array_count_values($list2)[$value] ?? 0) * $value;
	$total_distance += abs($value - $list2[$i]);
}

print_r([
	"total_distance" => $total_distance,
	"similarity_score" => $similarity_score]
);
