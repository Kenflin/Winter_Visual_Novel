// variables

VAR giftStolen = false
VAR turkeyStolen = false 
VAR frozen = false


EXTERNAL ShowCharacter(characterName, position, mood)

EXTERNAL HideCharacter(characterName)

EXTERNAL ChangeMood(characterName, mood)

EXTERNAL IsNotTalking(characterName,mood)

EXTERNAL IsTalking(characterName,mood)

-> start

=== start ===
{ShowCharacter("John", "Center", "Fine")} 
Narrator: Once upon a time there was a man so attached to his job that he forgot the most important thing about Christmas. In his mind, the most important thing was his son's gift and the turkey his wife kept asking for.#background #music #0-Office
Narrator: That's how he decided after dark to get in his car and hit the road. #background #1-carinterior
Narrator: What he didn't expect was that a snowstorm would blow him off the road, sending him sliding into a tree and leaving his car stranded on the side of the road. #music #cold
{HideCharacter("John")}
-> escena_carretera

=== escena_carretera ===
Narrator: John, which is the name of our protagonist, desperately tries to start the car, but it is impossible because the engine is broken.  #background #2-RoadCar
{ShowCharacter("John", "Left", "Fine")}
John: Damn it, everything has to happen to me.
-> primera_decision 

=== primera_decision ===
John: What the hell should I do now? #thought
*** [Follow the Road] {HideCharacter("John")} -> Seguir_la_carretera 
*** [Wait in the Car] -> Esperar_en_el_coche
=== Esperar_en_el_coche ===
Narrator: You see how the windows of the car start to freeze.
John: What the hell should I do now?#thought
*** [Follow the Road] {HideCharacter("John")}-> Seguir_la_carretera 
*** [Wait in the Car]-> Esperar_en_el_coche2

=== Esperar_en_el_coche2 ===
Narrator:The windows are so frozen that you can't see through them.
John: What the hell should I do now?#thought
*** [Follow the Road] {HideCharacter("John")}-> Seguir_la_carretera
*** [Wait in the Car]-> Esperar_en_el_coche3

=== Esperar_en_el_coche3 ===
Narrator: John's lips start to turn purple.
John: What the hell should I do now?#thought
*** [Follow the Road] {HideCharacter("John")}-> Seguir_la_carretera
*** [Wait in the Car]-> Esperar_en_el_coche4
=== Esperar_en_el_coche4 ===
Narrator: What are you waiting for?
John: What the hell should I do now?#thought
*** [Follow the Road] {HideCharacter("John")}-> Seguir_la_carretera
*** [Wait in the Car]-> Final_Congelado

=== Seguir_la_carretera ===
Narrator: You continue along the road towards the city. As you advance you see a faint light between the trees that ends up being from a cabin. #background #3-ForestCabin
Narrator: You decide to approach for help and shelter from the storm.
-> Bungalow_Familia

=== Bungalow_Familia ===
{ShowCharacter("John", "Left", "Fine")}
Narrator: You knock on the door and a lumberjack-looking man opens it. #music #hut
{ShowCharacter("Lumberjack", "Right", "Fine")}{IsNotTalking("John","Fine")}
Lumberjack: Hello sir, what can I do for you?
{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
John:Could you let me call a tow truck, sir? I had a little accident on the road because of the storm.
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Narrator: The Lumberjack pushes the door all the way open.
Lumberjack: Come in, of course you can, you shouldn't be out there in the stormy weather.
{IsTalking("John","Fine")}
{HideCharacter("John")}
{HideCharacter("Lumberjack")}
Narrator: John enters the cabin.#background #black
-> Interior_Bungalow_Familia

===Interior_Bungalow_Familia===
=Intro
{ShowCharacter("John", "Left", "Fine")}
{ShowCharacter("Lumberjack", "Right", "Fine")}
Narrator: The lumberjack offers John a seat and a hot drink. John takes the opportunity to take off his soaked jacket and rest for a while from all that has happened.#background #4-ForestCabinInterior1
->Conversacion_John_Lenador
=Conversacion_John_Lenador
John: Thanks for letting me in, I've had a crazy day.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Lumberjack: Don't worry,I know what it's like to feel this cold in winter and if you are not used to it in a few minutes you can freeze to death..{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
John: Oops, I wouldn't like to be that person.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Lumberjack: Well, what made you leave your home with this weather?{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
John: Where would I start... {IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}


-> Eleccion_John_Lenador
=Eleccion_John_Lenador

*** [Tell him about your son's gift] -> VerdadRegalo

*** [Tell him about the turkey for the dinner] -> PavoCena

*	->
    ->Salida_Lenador


=VerdadRegalo
John:I forgot to buy a gift for my son and I didn't want him to go through the night without his gift.
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Lumberjack: I'm so sorry, I also have a son called little Timmy, and I really don't know how he would be if he doesn't have his TurboMan Action Robot this year.
John: I don't know what it is about that robot that all the kids want it.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
->Eleccion_John_Lenador
=PavoCena
John:I was looking for a turkey for dinner tonight.I've been busy at work and I forgot to buy it, if my wife sees me coming back without the turkey, she'll carve me.
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Lumberjack: I don't think it's that big a deal man! My George is very understanding, in that case I'm sure he would find a solution for dinner.
Lumberjack: Thinking about it, there is a farm down the road you came from. You could ask there if they have any turkeys.
John: Thanks , I'll stop by as soon as I talk to the tow truck guys.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
->Eleccion_John_Lenador
=Salida_Lenador
Lumberjack: When you want to use the phone, you can find it in the next room.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
{HideCharacter("Lumberjack")}
{IsTalking("John","Fine")}
Narrator: The Lumberjack leaves the room to continue preparing his Christmas dinner.
Narrator: While John is drinking his hot chocolate, he sees that there are three socks hanging from the fireplace and above it, photographs of the lumberjack with his partner and son.
Narrator:As John heads toward the next room, he sees a gift on the Christmas tree with a tag that says "Little Timmy" on it.#background #5-ForestCabinInterior2
John: If borrow the gift from the Christmas tree, I won't have to buy anything for my son.#thought #music #decision
John: Although Mr. Lumberjack has been very nice to me by letting me pass. #thought
John: What should I do?#thought
*** [Use the phone to call the tow truck] -> LlamarGrua
*** [Steal the gift for your son] -> RobarRegalo

=LlamarGrua
{ShowCharacter("Phone", "Center", "Fine")}Narrator: You call the tow truck and wait for an answer.#music #hut
Phone:.
Phone:..
Phone:...
Phone:....
Phone: We are sorry but there are no cranes available at the moment. Please call back later.
Narrator: John hangs up the phone and the Lumberjack appears again.
{HideCharacter("Phone")}
{ShowCharacter("Lumberjack", "Right", "Fine")}
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Lumberjack: What have they told you?
{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
John: No answer, so it looks like I'm going to have to leave the car there and follow the road.
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Lumberjack: Leave me your address in case someone asks for the car and as soon as the storm passes I'm sure they can bring it to you.
{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Narrator: John gives him his home address and phone number.
Narrator: He grabs his jacket and leaves the cabin.
John: Goodbye, thanks for your hospitality.
{HideCharacter("John")}
Narrator: John leaves the cabin behind him and continues along the road#background #black
{IsTalking("Lumberjack","Fine")}
{HideCharacter("Lumberjack")}
->Direccion_Granja
-->END
=RobarRegalo
~giftStolen = true
Narrator: John takes the gift and runs out to the entrance of the house, leaving the door open.
{ShowCharacter("Lumberjack", "Right", "Fine")}Narrator: As John runs away from the cabin, he sees the silhouette of the lumberjack standing in the cabin doorway watching you flee the scene.#background #3-ForestCabin
{HideCharacter("John")}
Narrator: John has left his jacket with his wallet behind.{HideCharacter("Lumberjack")} #background #black
->Direccion_Granja
=Direccion_Granja
Narrator: The storm has passed, and after a long walk along the road you see the sign for the farm that the lumberjack told you about. #background #music #6-TurkeyFarmSign
Narrator: You decide to go over the farm to see if they are still selling turkeys.
->Exterior_Granja

==Exterior_Granja
{ShowCharacter("Farmer", "Right", "Fine")}
{ShowCharacter("John", "Left", "Fine")}
Narrator: John enters the farm and sees am old man leaning on a fence looking down at a turkey and approaches him.{IsTalking("John","Fine")}{IsNotTalking("Farmer","Fine")}#background #7-TurkeyFarm
John: Good sir, I know it's late, I hope I'm not disturbing you, I was just coming to ask if you still have any turkeys for sale.{IsTalking("John","Fine")}{IsNotTalking("Farmer","Fine")}
Narrator: The Farmer turns to John very slowly.
Farmer: I'm sorry son, we have no more turkeys left for sale.{IsTalking("Farmer","Fine")}{IsNotTalking("John","Fine")}
John: What about that turkey over there?{IsTalking("John","Fine")}{IsNotTalking("Farmer","Fine")}
Farmer:That turkey over there is Linda, she is the most beloved pet of this family and for nothing in this world would I put her on sale, even less if it is to be eaten.{IsTalking("Farmer","Fine")}{IsNotTalking("John","Fine")}
John: Damn old man, loving a turkey like if it was a dog.{IsTalking("John","Fine")}{IsNotTalking("Farmer","Fine")} # thought 
Farmer: Hold on, let me ask my brother to see if hopefully he has any turkey.{IsTalking("Farmer","Fine")}{IsNotTalking("John","Fine")}
{HideCharacter("Farmer")}
Narrator: The Farmer enters home{IsTalking("John","Fine")}
John: This would be a good time to steal that turkey. #thought #music #decision
John: No!, if that man loves that turkey so much, I shouldn't eat it. #thought
*** [Steal Linda (The turkey)] -> RobarPavo
*** [Wait for the Farmer] ->EsperarGranjero

=RobarPavo
~turkeyStolen = true
Narrator: John jumps the fence and pounces on the turkey.
Narrator: Poor Linda is not use to be treated that way so she is cought instantly.
Narrator: John runs out of the farm and continues along the road towards home.{HideCharacter("John")}
->Vuelta_a_Casa
=EsperarGranjero
Narrator: John waits for the Farmer leaning on the fence just as he was a few minutes ago.#music #hut
Narrator: Meanwhile, he watches as the turkey the Farmer had referred to as Linda plays with a ball as if it were a dog.
Narrator:Slowly you start to understand why this turkey is so important to the farmer and his family, when you looked into his eyes, you felt that Linda understood you.
{ShowCharacter("Farmer", "Right", "Fine")}Narrator: John was so absorbed watching the animal that he didn't even notice that the farmer had already come back.
Farmer: I'm back, son.{IsTalking("Farmer","Fine")}{IsNotTalking("John","Fine")}
Farmer: My brother told me he has a spare one, give me your address and he will send it to you in a moment.
John: How much do I owe you?{IsTalking("John","Fine")}{IsNotTalking("Farmer","Fine")}
Farmer: Don't worry, it's Christmas, you'll pay for it another time.{IsTalking("Farmer","Fine")}{IsNotTalking("John","Fine")}
John: Thank you so much.{IsTalking("John","Fine")}{IsNotTalking("Farmer","Fine")}
{HideCharacter("John")}
Narrator: John leaves the farm and continues down the road towards home.
{HideCharacter("Farmer")}
->Vuelta_a_Casa

===Vuelta_a_Casa===
Narrator: John looks at the clock and realizes that it's getting late and he should find a quicker way home so he decides to hitchhike.#background #music #black
Narrator: Luckily, a truck passes by and decides to stop and pick you up.
John: Good sir, I was on my way to the next village {ShowCharacter("John", "Right", "Fine")}#background #8-Truck
John: Is that ok for you?
Trucker: Yes, no problem, we'll be there in a jiffy.{ShowCharacter("Trucker", "Left", "Fine")}{IsNotTalking("John","Fine")}#music #trucker
Narrator: John enters the truck and enjoys the trucker's favorite radio station, Rock FM.{IsTalking("John","Fine")}{HideCharacter("John")}{HideCharacter("Trucker")}#background #black
Narrator: Not only that, but he also dared to sing a duet of Estopa with the truck driver.
->Llegada_a_casa
=== Llegada_a_casa==
Narrator: The driver drops you off at your door. John sees two parked cars that do not look familiar to him.#background #music #9-JohnHouse
Narrator: When he enters his home, he sees two groups of people.{ShowCharacter("John", "Center", "Fine")}#background #10-JohnHouseInterior
Narrator: On one side is the Lumberjack with his husband and son.{ShowCharacter("Lumberjack", "Left", "Fine")}
Narrator: On the other side there is a gentleman who by appearances you understand that is the farmer's brother.{ShowCharacter("FarmerBrother", "Right", "Fine")}
Narrator: Who do you talk to?{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}{IsNotTalking("FarmerBrother","Fine")}
->HablarFinal
=HablarFinal
*** {giftStolen} [Talk to the Lumberjack]{HideCharacter("FarmerBrother")}{ShowCharacter("John", "Center", "Fine")} {ShowCharacter("Lumberjack", "Left", "Fine")}-> HablarFinalLenadorBAD
 
*** {not giftStolen} [Talk to the Lumberjack]{HideCharacter("FarmerBrother")}{ShowCharacter("John", "Center", "Fine")}{ShowCharacter("Lumberjack", "Left", "Fine")}-> HablarFinalLenadorGOOD

*** {turkeyStolen} [Talk to the Farmer's Brother]{HideCharacter("Lumberjack")}{ShowCharacter("John", "Center", "Fine")} {ShowCharacter("FarmerBrother", "Right", "Fine")}-> HablarFinalGranjeroBAD

*** {not turkeyStolen} [Talk to the Farmer's Brother]{HideCharacter("Lumberjack")}{ShowCharacter("John", "Center", "Fine")}{ShowCharacter("FarmerBrother", "Right", "Fine")}-> HablarFinalGranjeroGOOD

*	->
    ->Final

=HablarFinalLenadorBAD
Narrator: As you approach the lumberjack, he can see that you are carrying Timmy's gift under your arm.#music #decision
Lumberjack: Shame on you!. I give you all my hospitality and you respond by stealing from me like that.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Narrator: John watches how his son witnesses the entire conversation and how embarrassed he is of his father.
John:I'm sorry, there is no excuse for what I've done, I only hope you dont call the police. I'm ashamed to of what I've done.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Lumberjack: I had come to give you back the jacket you left in my cabin, I hope this will not happen again.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Narrator: The Lumberjack approaches his family and the three of them leave the house.{HideCharacter("Lumberjack")}{IsTalking("John","Fine")}
->HablarFinal
=HablarFinalLenadorGOOD
Narrator:You approach the Lumberjack and his family and see how his son is holding the gift you saw on the Christmas tree in the cabin.#music #hut
Lumberjack: Hi John, Merry Christmas.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Lumberjack: I hope I'm not disturbing you, but after you left we were talking about what happened to you.
Lumberjack: And little Timmy was also listening and has decided to share his gift with your son.
Narrator: Little Timmy approaches John's son and gives him the gift box.
Narrator: They both open it and it is the TurboMan Action Robot. Just as the Lumberjack had already spoiled you.
Narrator: John's son approaches his father and thanks him.
John: Thank you Little Timmy and you too.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Lumberjack:No need to give them.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
*{not turkeyStolen} -> LenadorSinPavo 
*{turkeyStolen} ->LenadorConPavo
->HablarFinal
=LenadorSinPavo
Lumberjack: Besides, we have been talking with your wife and we have decided to have dinner together. That way we can share the turkey.
John: It looks great, let's enjoy the dinner together.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
{HideCharacter("Lumberjack")}
->HablarFinal
=LenadorConPavo
 Narrador: The Luberjack approaches his family and the three of them leave the house.{IsTalking("John","Fine")}
->HablarFinal
=HablarFinalGranjeroBAD
Narrator: As you approach the farmerhe can see that you are carrying the beloved Linda under your arm. #music #decision
Farmer's Brother:AJA! Just as the truck driver told us.{IsTalking("FarmerBrother","Fine")}{IsNotTalking("John","Fine")}
Farmer's Brother:What the hell were you planning to do with Linda?
John: I just wanted to have something for dinner.{IsTalking("John","Fine")}{IsNotTalking("FarmerBrother","Fine")}
Farmer's Brother: But how dare you just take a turkey that isn't yours.{IsTalking("FarmerBrother","Fine")}{IsNotTalking("John","Fine")}
Narrator: The Farmer's brother takes Linda from John's arms and carries her away, without forgetting the other turkey that he had promised John and taking it aswell.{HideCharacter("FarmerBrother")}{IsTalking("John","Fine")}
->HablarFinal
=HablarFinalGranjeroGOOD
Farmer's Brother: Good night John, my brother told me that you needed a turkey, so here I am.{IsTalking("FarmerBrother","Fine")}{IsNotTalking("John","Fine")}#music #hut
Farmer's Brother: I gave your wife the turkey and some potatoes we had left at the farm.
Farmer's Brother: I hope you enjoy them. Merry Christmas!
John: Thank you very much for everything. I will have to see your brother again to thank him personally.{IsTalking("John","Fine")}{IsNotTalking("FarmerBrother","Fine")}
{HideCharacter("FarmerBrother")}
Narrator: The Farmer leaves the house.
->HablarFinal


=== Final
*{turkeyStolen}{giftStolen} ->Final_BAD_BAD
*{giftStolen}{not turkeyStolen} -> Final_BAD_GOOD
*{not giftStolen}{turkeyStolen} -> Final_GOOD_BAD
*{not giftStolen}{not turkeyStolen} ->Final_GOOD_GOOD
--> END
===Final_GOOD_GOOD===
Narrador: John sits at the table with his family and new friends.{ShowCharacter("John","Center","Fine")}{ShowCharacter("Wife","Right","Fine")}{ShowCharacter("Lumberjack","Left","Fine")}#background #music #11-End
Narrador: John realizes that after his adventure and coming back empty-handed, he had gained a new friendship.
Narrador: And that the most important thing about Christmas is not the gift you give or the gift you receive or the feast you have for dinner.
Narrador: But to be able to share it with people you love.

-> Despedida
===Final_GOOD_BAD===
Narrador: Even though John had not surrendered to steal the gift, stealing that turkey didn't seem right to his wife.{ShowCharacter("John","Center","Fine")}{ShowCharacter("Wife","Right","Fine")}{ShowCharacter("Son","Left","Fine")}#background #music #11-EndBad
Narrador: She decided that she didn't want to spend that night with John because of what he had done and she and her son went to her parent's house.{HideCharacter("Wife")}{HideCharacter("Son")}
Narrador: John spent Christmas alone that night with nothing to eat, he had plenty of time to think and realize that stealing that turkey did him no good and that even if he didn't have that food, he would have been happier surrounded by his family.{IsNotTalking("John","Fine")}
->Despedida

===Final_BAD_GOOD===
Narrador: John shouldn't have touched that gift. From that moment on, his son no longer looked at him with the same eyes.{ShowCharacter("John","Center","Fine")}{ShowCharacter("Wife","Right","Fine")}{ShowCharacter("Son","Left","Fine")}#background #music #11-EndBad
Narrador: That night his son preferred not to eat dinner and spend the night locked in his room.{HideCharacter("Son")}
Narrador: John's wife didn't want to miss out the delicious turkey, but opted to ignore John while she was eating it.{IsNotTalking("Wife","Fine")}
Narrador: John had lost more than he could have gained by stealing the gift that night. And he realized that his son's perception of him as a thief would not change.{IsNotTalking("Wife","Fine")}
->Despedida

===Final_BAD_BAD===
Narrador: What were you thinking?{ShowCharacter("John","Center","Fine")}#background #music #11-EndBad
Narrador: Since when stealing from a child and stealing a pet would end up well?
Narrador: John is home alone.{IsNotTalking("John","Fine")}
Narrador: His wife and son have gone to his parents' house to spend the rest of Christmas. Neither of them wants to know anything about John.
Narrador: John realized that the only thing he needed that Christmas was to spend it with his loved ones around him, and that he gave more importance to a gift and a dinner than to his family.


->Despedida
=== Final_Congelado ===
{ChangeMood("John", "Serious")}
Narrator: You begin to lose control over your limbs and gradually close your eyes until you never open them again.
Narrator: John died waiting for the solution to come on its own. 
Narrator: Don't be like John.
~frozen= true
->Despedida

=== Despedida ===
Narrator: I hope you enjoyed this story.{HideCharacter("John")}{HideCharacter("Lumberjack")}{HideCharacter("Wife")}#background #music #12-GoodBye 
*{frozen} -> frozenEnd
*{not frozen} ->notFrozenEnd
=frozenEnd
Narrator: And if you are one of those who have been left waiting in the car, try again.
Narrator: Merry Christmas!#FinalSentence
-->END
=notFrozenEnd
Narrator: I hope you learned as John did.
Narrator: Merry Christmas!#FinalSentence
-->END





