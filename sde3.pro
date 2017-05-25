/* CPSC/ECE - 3520 Fuzzy Set Notation Semantic Validator.
 * Copyright (C) 2017 Joshua Forbes
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

/* predicate that is the purpose of this project. 
 * Verifies that Input follows the following constraints:
 *		1) input consists of a single two tuple where the first element is a two 
 *         tuple and the second element is a list (slist) of two tuples.
 *		2) the domain is a two tuple like so:
 *				(DL, DH)
 *         where DL and DH are both integers and DH >= DL.
 *		3) slist is a prolog list of two tuples like so: 
 *				(Di, Vi)
 *         where Di is an integer such that DL >= Di <= DH
 *      4) slist is not empty, or slist has at least one element
 *      5) all Vi in slist are within the interval of 0 to 1 inclusive
 *		6) DL is the integer of the first tuple in slist
 *		7) DH is the integer of the last tuple in slist
 *		8) Di are consecutive integers in the slist tuples. 
 */
mu(Input) :- hasProperForm(Input), domainIsInts(Input), slistTuplesValid(Input), 
		membershipValsValid(Input), firstIntIsDL(Input), lastIntisDH(Input), 
		breakItUp(Input), !.

/* states that Input must have the general form as a fact.*/
hasProperForm(((_,_),[(_,_) | _ ])).

/* enforces proper integer domain*/
domainIsInts(((DL,DH),[(_,_) | _ ])) :- integer(DL), integer(DH), DH >= DL. 

/* enforces int, float tuples with proper restrictions*/
slistTuplesValid(((DL,DH),[(Di,Vi) | C])) :- integer(Di), float(Vi), Di >= DL, Di =< DH, 
		slistTuplesValid(((DL,DH),C)).
slistTuplesValid(((DL,DH),[(Di,Vi)])) :- integer(Di), float(Vi), Di >= DL, Di =< DH.

/* enforces that all vi are within the interval 0 - 1 inclusive*/
membershipValsValid(((_,_),[(_,Vi) | C])) :- Vi >= 0, Vi =< 1, membershipValsValid(((_,_),C)).
membershipValsValid(((_,_),[(_,Vi)])) :- Vi >= 0, Vi =< 1.

/* enforces that the first integer in slist is DL*/
firstIntIsDL(((DL,_),[(Di,_) | _ ])) :- DL =:= Di.

/* enforces that the last integer in slist is DH*/
lastIntisDH(((DL,DH),[(_,_) | C])) :- lastIntisDH(((DL,DH),C)).
lastIntisDH(((_,DH),[(Di,_)])) :- DH =:= Di.

/* enforces that the entries in slist are consecutive*/
breakItUp(((_,_),[(Di,_) | C])):- slistIntsConsec(((Di,_),C)).
breakItUp(((PREVAL,_),[(Di,_)])):- slistIntsConsecSingleTuple(((PREVAL,_),[(Di,_)])).
slistIntsConsec(((PREVAL,_),[(Di,_) | C])) :- PREVAL < Di, slistIntsConsec(((Di,_),C)).
slistIntsConsec(((PREVAL,_),[(Di,_)])) :- PREVAL < Di.
slistIntsConsecSingleTuple(((PREVAL,_),[(Di,_)])):- PREVAL =< Di.
