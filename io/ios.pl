% 200 recorded inputs and outputs (swipl -g record -t halt io/run.pl writes this; check compares).
io(1, analyse, [select], [base, rec]).
io(2, bound, [member, 11], 11).
io(3, actual, [last, [b, c]], 1).
io(4, certificate, [member, 0], cert(member, [0-0-0])).
io(5, analyse, [last], [base, rec]).
io(6, bound, [member, 6], 6).
io(7, actual, [length, [c, a, c, c, b]], 1).
io(8, certificate, [append_split, 1], cert(append_split, [0-1-1, 1-2-2])).
io(9, analyse, [length], [base, rec]).
io(10, bound, [twice, 0], 0).
io(11, actual, [twice, [a, b, b, b]], 8).
io(12, certificate, [select, 1], cert(select, [0-0-0, 1-1-1])).
io(13, analyse, [select], [base, rec]).
io(14, bound, [length, 2], 1).
io(15, actual, [member, [c, b, a, c, a]], 5).
io(16, certificate, [member, 0], cert(member, [0-0-0])).
io(17, analyse, [last], [base, rec]).
io(18, bound, [member, 3], 3).
io(19, actual, [select, []], 0).
io(20, certificate, [twice, 1], cert(twice, [0-0-0, 1-2-2])).
io(21, analyse, [member], [base, rec]).
io(22, bound, [select, 8], 8).
io(23, actual, [last, [b]], 1).
io(24, certificate, [length, 2], cert(length, [0-1-1, 1-1-1, 2-1-1])).
io(25, analyse, [member], [base, rec]).
io(26, bound, [last, 9], 1).
io(27, actual, [length, [a]], 1).
io(28, certificate, [length, 2], cert(length, [0-1-1, 1-1-1, 2-1-1])).
io(29, analyse, [member], [base, rec]).
io(30, bound, [last, 10], 1).
io(31, actual, [member, []], 0).
io(32, certificate, [append_split, 0], cert(append_split, [0-1-1])).
io(33, analyse, [length], [base, rec]).
io(34, bound, [member, 8], 8).
io(35, actual, [length, [b, a, c]], 1).
io(36, certificate, [append_split, 2], cert(append_split, [0-1-1, 1-2-2, 2-3-3])).
io(37, analyse, [last], [base, rec]).
io(38, bound, [member, 5], 5).
io(39, actual, [last, []], 0).
io(40, certificate, [member, 1], cert(member, [0-0-0, 1-1-1])).
io(41, analyse, [last], [base, rec]).
io(42, bound, [length, 4], 1).
io(43, actual, [last, [a, b, a, c, b]], 1).
io(44, certificate, [length, 4], cert(length, [0-1-1, 1-1-1, 2-1-1, 3-1-1, 4-1-1])).
io(45, analyse, [select], [base, rec]).
io(46, bound, [member, 11], 11).
io(47, actual, [last, [c, a, a, b, b, b]], 1).
io(48, certificate, [twice, 0], cert(twice, [0-0-0])).
io(49, analyse, [append_split], [base, rec]).
io(50, bound, [length, 4], 1).
io(51, actual, [member, [b, b, c]], 3).
io(52, certificate, [select, 3], cert(select, [0-0-0, 1-1-1, 2-2-2, 3-3-3])).
io(53, analyse, [last], [base, rec]).
io(54, bound, [last, 4], 1).
io(55, actual, [length, []], 1).
io(56, certificate, [member, 2], cert(member, [0-0-0, 1-1-1, 2-2-2])).
io(57, analyse, [member], [base, rec]).
io(58, bound, [last, 11], 1).
io(59, actual, [last, [a, b, c]], 1).
io(60, certificate, [length, 4], cert(length, [0-1-1, 1-1-1, 2-1-1, 3-1-1, 4-1-1])).
io(61, analyse, [select], [base, rec]).
io(62, bound, [select, 11], 11).
io(63, actual, [length, [b, c, a, b, b, c]], 1).
io(64, certificate, [twice, 4], cert(twice, [0-0-0, 1-2-2, 2-4-4, 3-6-6, 4-8-8])).
io(65, analyse, [last], [base, rec]).
io(66, bound, [length, 0], 1).
io(67, actual, [member, [a, a, a, a]], 4).
io(68, certificate, [last, 4], cert(last, [0-0-0, 1-1-1, 2-1-1, 3-1-1, 4-1-1])).
io(69, analyse, [select], [base, rec]).
io(70, bound, [twice, 10], 20).
io(71, actual, [length, []], 1).
io(72, certificate, [twice, 4], cert(twice, [0-0-0, 1-2-2, 2-4-4, 3-6-6, 4-8-8])).
io(73, analyse, [select], [base, rec]).
io(74, bound, [append_split, 4], 5).
io(75, actual, [append_split, [a, b, a, b]], 5).
io(76, certificate, [length, 0], cert(length, [0-1-1])).
io(77, analyse, [select], [base, rec]).
io(78, bound, [select, 2], 2).
io(79, actual, [last, [c, b, b, c]], 1).
io(80, certificate, [select, 1], cert(select, [0-0-0, 1-1-1])).
io(81, analyse, [twice], [base, base, rec]).
io(82, bound, [append_split, 5], 6).
io(83, actual, [last, [a, b, b, b]], 1).
io(84, certificate, [length, 1], cert(length, [0-1-1, 1-1-1])).
io(85, analyse, [member], [base, rec]).
io(86, bound, [append_split, 1], 2).
io(87, actual, [append_split, [c, c]], 3).
io(88, certificate, [last, 2], cert(last, [0-0-0, 1-1-1, 2-1-1])).
io(89, analyse, [append_split], [base, rec]).
io(90, bound, [member, 8], 8).
io(91, actual, [length, [a, a, b, c, a, c]], 1).
io(92, certificate, [twice, 3], cert(twice, [0-0-0, 1-2-2, 2-4-4, 3-6-6])).
io(93, analyse, [append_split], [base, rec]).
io(94, bound, [member, 1], 1).
io(95, actual, [length, []], 1).
io(96, certificate, [member, 0], cert(member, [0-0-0])).
io(97, analyse, [select], [base, rec]).
io(98, bound, [member, 10], 10).
io(99, actual, [last, [b, a]], 1).
io(100, certificate, [twice, 2], cert(twice, [0-0-0, 1-2-2, 2-4-4])).
io(101, analyse, [append_split], [base, rec]).
io(102, bound, [append_split, 0], 1).
io(103, actual, [select, []], 0).
io(104, certificate, [member, 4], cert(member, [0-0-0, 1-1-1, 2-2-2, 3-3-3, 4-4-4])).
io(105, analyse, [append_split], [base, rec]).
io(106, bound, [member, 12], 12).
io(107, actual, [last, [a, c, a, a, a]], 1).
io(108, certificate, [append_split, 1], cert(append_split, [0-1-1, 1-2-2])).
io(109, analyse, [append_split], [base, rec]).
io(110, bound, [select, 8], 8).
io(111, actual, [append_split, [a, a, b, b, c]], 6).
io(112, certificate, [twice, 4], cert(twice, [0-0-0, 1-2-2, 2-4-4, 3-6-6, 4-8-8])).
io(113, analyse, [last], [base, rec]).
io(114, bound, [append_split, 0], 1).
io(115, actual, [length, []], 1).
io(116, certificate, [last, 0], cert(last, [0-0-0])).
io(117, analyse, [member], [base, rec]).
io(118, bound, [twice, 9], 18).
io(119, actual, [append_split, [c, a, b, b]], 5).
io(120, certificate, [append_split, 3], cert(append_split, [0-1-1, 1-2-2, 2-3-3, 3-4-4])).
io(121, analyse, [append_split], [base, rec]).
io(122, bound, [select, 8], 8).
io(123, actual, [member, [c, b, b, c, a]], 5).
io(124, certificate, [last, 4], cert(last, [0-0-0, 1-1-1, 2-1-1, 3-1-1, 4-1-1])).
io(125, analyse, [length], [base, rec]).
io(126, bound, [append_split, 0], 1).
io(127, actual, [last, [c, a]], 1).
io(128, certificate, [twice, 1], cert(twice, [0-0-0, 1-2-2])).
io(129, analyse, [last], [base, rec]).
io(130, bound, [select, 10], 10).
io(131, actual, [twice, [a, a, a, a]], 8).
io(132, certificate, [select, 4], cert(select, [0-0-0, 1-1-1, 2-2-2, 3-3-3, 4-4-4])).
io(133, analyse, [last], [base, rec]).
io(134, bound, [select, 2], 2).
io(135, actual, [select, [c, a, c, b, c]], 5).
io(136, certificate, [twice, 3], cert(twice, [0-0-0, 1-2-2, 2-4-4, 3-6-6])).
io(137, analyse, [length], [base, rec]).
io(138, bound, [member, 8], 8).
io(139, actual, [last, [a, c]], 1).
io(140, certificate, [last, 1], cert(last, [0-0-0, 1-1-1])).
io(141, analyse, [member], [base, rec]).
io(142, bound, [twice, 0], 0).
io(143, actual, [member, [b, c, c, b]], 4).
io(144, certificate, [select, 2], cert(select, [0-0-0, 1-1-1, 2-2-2])).
io(145, analyse, [select], [base, rec]).
io(146, bound, [twice, 2], 4).
io(147, actual, [length, [c, a, c, a]], 1).
io(148, certificate, [twice, 1], cert(twice, [0-0-0, 1-2-2])).
io(149, analyse, [member], [base, rec]).
io(150, bound, [member, 2], 2).
io(151, actual, [length, [a, c]], 1).
io(152, certificate, [length, 4], cert(length, [0-1-1, 1-1-1, 2-1-1, 3-1-1, 4-1-1])).
io(153, analyse, [length], [base, rec]).
io(154, bound, [twice, 11], 22).
io(155, actual, [last, [a, a, a]], 1).
io(156, certificate, [twice, 2], cert(twice, [0-0-0, 1-2-2, 2-4-4])).
io(157, analyse, [twice], [base, base, rec]).
io(158, bound, [twice, 7], 14).
io(159, actual, [length, [c, a]], 1).
io(160, certificate, [twice, 2], cert(twice, [0-0-0, 1-2-2, 2-4-4])).
io(161, analyse, [last], [base, rec]).
io(162, bound, [twice, 0], 0).
io(163, actual, [twice, [a, c, a]], 6).
io(164, certificate, [length, 1], cert(length, [0-1-1, 1-1-1])).
io(165, analyse, [select], [base, rec]).
io(166, bound, [twice, 7], 14).
io(167, actual, [member, [a, b, c, c]], 4).
io(168, certificate, [select, 1], cert(select, [0-0-0, 1-1-1])).
io(169, analyse, [last], [base, rec]).
io(170, bound, [member, 9], 9).
io(171, actual, [select, [b, b, c, a, b]], 5).
io(172, certificate, [member, 1], cert(member, [0-0-0, 1-1-1])).
io(173, analyse, [last], [base, rec]).
io(174, bound, [select, 12], 12).
io(175, actual, [select, [b, b, a, b, a, a]], 6).
io(176, certificate, [last, 1], cert(last, [0-0-0, 1-1-1])).
io(177, analyse, [member], [base, rec]).
io(178, bound, [select, 5], 5).
io(179, actual, [append_split, [b, c, b]], 4).
io(180, certificate, [append_split, 4], cert(append_split, [0-1-1, 1-2-2, 2-3-3, 3-4-4, 4-5-5])).
io(181, analyse, [member], [base, rec]).
io(182, bound, [twice, 4], 8).
io(183, actual, [twice, [c]], 2).
io(184, certificate, [twice, 0], cert(twice, [0-0-0])).
io(185, analyse, [twice], [base, base, rec]).
io(186, bound, [select, 10], 10).
io(187, actual, [length, []], 1).
io(188, certificate, [length, 0], cert(length, [0-1-1])).
io(189, analyse, [select], [base, rec]).
io(190, bound, [length, 6], 1).
io(191, actual, [twice, []], 0).
io(192, certificate, [last, 3], cert(last, [0-0-0, 1-1-1, 2-1-1, 3-1-1])).
io(193, analyse, [last], [base, rec]).
io(194, bound, [append_split, 0], 1).
io(195, actual, [twice, [a, c, a]], 6).
io(196, certificate, [member, 2], cert(member, [0-0-0, 1-1-1, 2-2-2])).
io(197, analyse, [select], [base, rec]).
io(198, bound, [last, 5], 1).
io(199, actual, [last, [a]], 1).
io(200, certificate, [length, 3], cert(length, [0-1-1, 1-1-1, 2-1-1, 3-1-1])).
