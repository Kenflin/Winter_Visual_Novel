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
Narrator: Once upon a time there was a man so attached to his job that he forgot the most important thing about Christmas. In his mind, the most important thing was his son's gift and the turkey his wife kept asking for.
Narrator: That's how he decided after dark to get in his car and hit the road.
Narrator: What he didn't expect was that a snowstorm would blow him off the road, sending him sliding into a tree and leaving his car stranded on the side of the road. #sound #scream
{HideCharacter("John")}
-> escena_carretera

=== escena_carretera ===
Narrator: John , que así es como se llama nuestro protagonista, intenta desesperadamente arrancar el coche, pero es imposible ya que con el golpe el motor está inservible. 
{ShowCharacter("John", "Left", "Fine")}
John: Maldita sea, todo me tiene que pasar a mí. 
-> primera_decision 

=== primera_decision ===
John: ¿Que demonios hago ahora? #thought
*** [Seguir la Carretera] {HideCharacter("John")} -> Seguir_la_carretera 
*** [Esperar en el Coche] -> Esperar_en_el_coche
=== Esperar_en_el_coche ===
Narrator: Ves como empiezan a congelarse los cristales del coche.
John: ¿Que demonios hago ahora?#thought
*** [Seguir la Carretera] {HideCharacter("John")}-> Seguir_la_carretera 
*** [Esperar en el Coche]-> Esperar_en_el_coche2

=== Esperar_en_el_coche2 ===
Narrator:Los cristales están tan congelados que no puedes ver a través de ellos.
John: ¿Que demonios hago ahora?#thought
*** [Seguir la Carretera] {HideCharacter("John")}-> Seguir_la_carretera
*** [Esperar en el Coche]-> Esperar_en_el_coche3

=== Esperar_en_el_coche3 ===
Narrator: Los labios de John empiezan a ponerse de un color morado.
John: ¿Que demonios hago ahora?#thought
*** [Seguir la Carretera] {HideCharacter("John")}-> Seguir_la_carretera
*** [Esperar en el Coche]-> Esperar_en_el_coche4
=== Esperar_en_el_coche4 ===
Narrator: ¿A que estás esperando?
John: ¿Que demonios hago ahora?#thought
*** [Seguir la Carretera] {HideCharacter("John")}-> Seguir_la_carretera
*** [Esperar en el Coche]-> Final_Congelado

=== Seguir_la_carretera ===
Narrator: Continuas la carretera en dirección a la ciudad.Según avanzas ves una tenue luz entre los arboles que termina siendo de una cabaña. 
Narrator: Decides acercate a pedir ayuda y a resguardarte de la tormenta.
-> Bungalow_Familia

=== Bungalow_Familia ===
{ShowCharacter("John", "Left", "Fine")}
Narrator: Llamas a la puerta y te abre un señor con pinta de leñador.
{ShowCharacter("Lumberjack", "Right", "Fine")}{IsNotTalking("John","Fine")}
Leñador: Buenas señor , ¿Qué desea?
{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
John:¿Podría dejarme llamar a una grua señor? He tenido un pequeño accidente en la carretera a causa de la tormenta.
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Narrator: El Leñador empuja la puerta hasta abrirla completamente.
Leñador: Pase pase, por supuesto que puede, no debería estar ahí fuera con el temporal que hace.
{IsTalking("John","Fine")}
{HideCharacter("John")}
{HideCharacter("Lumberjack")}
Narrator: John entra a la casa.

-> Interior_Bungalow_Familia

===Interior_Bungalow_Familia===
=Intro
{ShowCharacter("John", "Left", "Fine")}
{ShowCharacter("Lumberjack", "Right", "Fine")}
Narrator: El señor leñador le ofrece un asiento y una bebida caliente a John. John aprovecha para quitarse la chaqueta que lleva empapada y descansar un rato de todo lo sucedido.
->Conversacion_John_Lenador
=Conversacion_John_Lenador
John: Gracias por dejarme entrar, llevo un dia de locos.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Leñador: No hay que darlas, sé lo que es sentir este frío en invierno y si no estas acostumbrado en pocos minutos puedes morir congelado.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
John: Vaya, no me gustaria ser esa persona.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Leñador: Bueno, ¿que te ha hecho salir con este temporal de tu hogar?{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
John: Pues por donde empezar... {IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}


-> Eleccion_John_Lenador
=Eleccion_John_Lenador

*** [Contarle lo del regalo de tu hijo] -> VerdadRegalo

*** [Contarle lo del pavo de la cena] -> PavoCena

*	->
    ->Salida_Lenador


=VerdadRegalo
John: Se me ha olvidado comprarle un regalo a mi hijo y no quería que pasase esta noche sin su regalo.No me sentiría buen padre.
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Leñador: Vaya, cuanto lo siento, yo también tengo un hijo, el pequeño Timmy, y la verdad que no se como se pondría si este año le faltase su Robot de acción TurboMan.
John: No se que tiene ese robot que todos los niños lo quieren.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
->Eleccion_John_Lenador
=PavoCena
John: Estaba buscando un pavo para la cena de esta noche, con tanto trabajo se me ha olvidado buscarlo antes, si mi mujer me ve volviendo sin el pavo, me trincha a mi.
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Leñador: No creo que sea para tanto hombre! Mi George es muy comprensivo, seguro que buscaría una solución para la cena de hoy. 
Leñador: Ahora que lo pienso, hay una granja siguiendo la carretera por la que has venido. Podrías preguntar alli si tienen algun pavo.
John: Gracias , me pasaré en cuanto hable con los de la grúa.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
->Eleccion_John_Lenador
=Salida_Lenador
Leñador: Cuando quieras utilizar el teléfono, lo tienes en la sala de al lado.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
{HideCharacter("Lumberjack")}
{IsTalking("John","Fine")}
Narrator: El leñador sale de la habitación para seguir preparando su cena navideña.
Narrator: Mientras John se toma el chocolate caliente, ve que hay tres calcetines colgados de la chimenea y sobre ella, fotografias donde sale el leñador con su pareja y su hijo.
Narrator: Cuando John se dirige hacia la habitación del telefono, ve en el arbol de navidad un regalo en el que hay una etiqueta que pone "Little Timmy".
John: Si cojo ese regalo de ahí ya no tendré que comprarle nada a mi hijo.#thought
John: Aunque el señor leñador se ha portado muy bien conmigo dejandome pasar. #thought
John: ¿Que debería hacer?#thought
*** [Utilizar el telefono para llamar a la grua] -> LlamarGrua
*** [Robar el regalo para tu hijo] -> RobarRegalo

=LlamarGrua
{ShowCharacter("Phone", "Center", "Fine")}Narrator: Llamas a la grua y esperas a que te contesten.
Phone:.
Phone:..
Phone:...
Phone:....
Phone: Lo sentimos pero ahora mismo no se encuentran gruas disponibles. Vuelva a llamar más tarde.
Narrator: John cuelga el telefono y aparece el Leñador de nuevo.
{HideCharacter("Phone")}
{ShowCharacter("Lumberjack", "Right", "Fine")}
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Leñador: ¿Que te han dicho?
{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
John: No me han contestado, me parece que voy a tener que dejar el coche ahí y seguir la carretera.
{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Leñador: Dejame tu dirección por si pregunta alguien por el coche y en cuanto pase el temporal seguro que pueden acercartelo.
{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Narrator: John le da dirección de su casa y su numero de telefono.
Narrator: Coge su chaqueta y sale de la cabaña.
John: Adios, gracias por tu hospitalidad.
{HideCharacter("John")}
Narrator: John deja tras de si la cabaña y continua el camino de la carretera.
{IsTalking("Lumberjack","Fine")}
{HideCharacter("Lumberjack")}
->Direccion_Granja
-->END
=RobarRegalo
~giftStolen = true
Narrator: John coge el regalo y sale corriendo hacia la entrada de la casa dejando la puerta abierta.
{ShowCharacter("Lumberjack", "Right", "Fine")}Narrator: Mientras John se distancia de la cabaña a toda prisa, ve la silueta del leñador apostado en la puerta de la cabaña viendo como huyes del lugar.
{HideCharacter("John")}
Narrator: John se ha dejado la chaqueta con su cartera con las prisas.
{HideCharacter("Lumberjack")}
->Direccion_Granja
=Direccion_Granja
Narrator: La tormenta ha amainado, y tras un largo camino por la carretera ves el cartel de la granja que te comentó el leñador. 
Narrator: Decides acercarte para ver si consigues algo para la cena de esta noche.
->Exterior_Granja

==Exterior_Granja
{ShowCharacter("Farmer", "Right", "Fine")}
{ShowCharacter("John", "Left", "Fine")}
Narrator: John entra a la granja y ve a un señor apoyado en una valla mirando hacia un pavo y se acerca a él.
John: Buenas señor, se que es tarde, espero no molestarle, venía a preguntarle si aún le quedaba algún pavo a la venta.
Narrator: El señor granjero se gira hacia John muy lentamente.
Granjero: Lo siento hijo , no nos quedan mas pavos a la venta.
John: ¿Y ese pavo de ahí?
Granjero: Ese pavo de ahí es Linda, es la mascota más querida de esta familia y por nada del mundo la pondría a la venta y mucho menos si es para comersela.
John: Maldito viejo, encariñarse de un pavo como si fuese un perro.# thought
Granjero: Espera un momento, dejame preguntarle a mi hermano a ver si con suerte él tiene algún pavo de sobra.
{HideCharacter("Farmer")}
Narrator: El Granjero se dirige hacia su casa
John: Este sería un buen momento para llevarse ese pavo # thought
John: No , si ese hombre quiere tanto a ese pavo, no debería comermelo. # thought
*** [Robar a Linda (El pavo)] -> RobarPavo
*** [Esperar a que vuelva el Granjero] ->EsperarGranjero

=RobarPavo
~turkeyStolen = true
Narrator: John salta la valla y se abalanza sobre el pavo.
Narrator: La pobre linda no acostumbrada a que la traten de esa manera es atrapada al instante.
Narrator: John sale de la granja corriendo continuando la carretera dirección a casa.{HideCharacter("John")}
->Vuelta_a_Casa
=EsperarGranjero
Narrator: John espera al Granjero apoyado en la valla tal y como estaba él hace unos minutos.
Narrator: Mientras tanto, ve como el pavo al que el Granjero se habia referido como Linda juega con una pelota como si de un perro se tratara.
Narrator:Poco a poco comprendes por que ese pavo era tan importante para el granjero y su familia, cuando le mirabas a los ojos, sentias que Linda te endendía.
{ShowCharacter("Farmer", "Right", "Fine")}Narrator: John estaba tan asismimado mirando aquel animal que ni se habia dado cuenta de que el Granjero ya habia vuelto.
Granjero: Ya estoy de vuelta hijo.
Granjero: Mi hermano me ha dicho que tiene un pavo de sobra , dame tu dirección y te lo envia en un momento.
John: ¿Cuanto le debo?
Granjero: No se preocupe, es Navidad, ya lo pagará en otra ocasión.
John: Muchas gracias de veras.
{HideCharacter("John")}
Narrator: John sale de la granja continuando la carretera dirección a casa.
{HideCharacter("Farmer")}
->Vuelta_a_Casa

===Vuelta_a_Casa===
Narrator: John se fija en el reloj y se da cuenta de que ya se hace tarde y debería buscar una manera mas rapida de volver a casa así que decide hacer Autostop.
Narrator: Casualmente, un camión pasa por alli y decide parar a recogerte.
John: Buenas Señor ,me dirigía hacia el pueblo que está aqui al lado {ShowCharacter("John", "Left", "Fine")}
John: ¿Le viene bien?
Camionero: Si, sin problema , montese que llegamos en un santiamen.{ShowCharacter("Trucker", "Right", "Fine")}{IsNotTalking("John","Fine")}
Narrator: John se monta en el camión y disfruta de la emisora de radio favorita del camionero, Rock FM.{IsTalking("John","Fine")}
Narrator: No solo eso sino que además se atrevió a cantar a duo una de Estopa con el camionero.{HideCharacter("John")}{HideCharacter("Trucker")}
->Llegada_a_casa
=== Llegada_a_casa==
Narrator: El conductor te deja en la puerta de tu casa.John ve que hay dos coches aparcados que no le suenan de nada.
Narrator: Cuando entra a casa, ve a dos grupos de personas.{ShowCharacter("John", "Center", "Fine")}
Narrator: Por un lado esta el Leñador junto con su marido y su hijo.{ShowCharacter("Lumberjack", "Left", "Fine")}
Narrator: Por el otro está un señor que por las apariencias entiendes que es el hermano del granjero.{ShowCharacter("FarmerBrother", "Right", "Fine")}
Narrator: ¿Con quien hablas?{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}{IsNotTalking("FarmerBrother","Fine")}
->HablarFinal
=HablarFinal
*** {giftStolen} [Hablar con el leñador]{HideCharacter("FarmerBrother")}{ShowCharacter("John", "Center", "Fine")} {ShowCharacter("Lumberjack", "Left", "Fine")}-> HablarFinalLenadorBAD
 
*** {not giftStolen} [Hablar con el leñador]{HideCharacter("FarmerBrother")}{ShowCharacter("John", "Center", "Fine")}{ShowCharacter("Lumberjack", "Left", "Fine")}-> HablarFinalLenadorGOOD

*** {turkeyStolen} [Hablar con el hermano del granjero]{HideCharacter("Lumberjack")}{ShowCharacter("John", "Center", "Fine")} {ShowCharacter("FarmerBrother", "Right", "Fine")}-> HablarFinalGranjeroBAD

*** {not turkeyStolen} [Hablar con el hermano del granjero]{HideCharacter("Lumberjack")}{ShowCharacter("John", "Center", "Fine")}{ShowCharacter("FarmerBrother", "Right", "Fine")}-> HablarFinalGranjeroGOOD

*	->
    ->Final

=HablarFinalLenadorBAD
Narrator: Segun te acercas al leñador, él puede ver como tienes el regalo de Timmy bajo el brazo.
Leñador: Te parecerá bonito.Te doy toda mi hospitalidad y me respondes robandome de esa manera.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Narrator: John ve como su hijo presencia toda la conversación y como se siente avergonzado por su padre.
John:Lo siento, no tengo manera de exculparme por lo que he hecho , solo espero que no llameis a la policia. Suficiente verguenza siento ya por tener que hacerlo.{IsTalking("Johj","Fine")}{IsNotTalking("Lumberjack","Fine")}
Leñador: Habia venido a devolverte la chaqueta que te dejaste en mi cabaña, espero que esto no vuelva a suceder.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Narrator: El leñador se acerca a su familia y los tres abandonan la casa.{HideCharacter("Lumberjack")}{IsTalking("John","Fine")}
->HablarFinal
=HablarFinalLenadorGOOD
Narrator:Te acercas al leñador y a su familia y ves como su hijo tiene en sus manos el regalo que viste en el arbol de navidad de la cabaña.
Leñador: Buenas John, Feliz Navidad.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
Leñador: Espero no molestarte, pero despues de que te fueras y llegara George con nuestro hijo, estuvimos hablando de lo que me contaste.
Leñador: Y el pequeño Timmy tambien estuvo escuchando y ha decidido compartir su regalo con tu hijo.
Narrator: El pequeño Timmy se acerca al hijo de John y le da la caja del regalo.
Narrator: Ambos lo abren y es el Robot de acción TurboMan. Tal y como ya te habia spoileado el leñador.
Narrator: El hijo de John se acerca a su padre y le da las gracias.
John: Gracias Pequeño Timmy y a vosotros tambien.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
Leñador:No hay que darlas.{IsTalking("Lumberjack","Fine")}{IsNotTalking("John","Fine")}
*{not turkeyStolen} -> LenadorSinPavo 
*{turkeyStolen} ->LenadorConPavo
->HablarFinal
=LenadorSinPavo
Leñador: Además, hemos estado hablando con tu esposa y hemos decido cenar todos juntos. Asi podemos compartir la cena.
John: Me parece genial, disfrutemos la cena todos juntos.{IsTalking("John","Fine")}{IsNotTalking("Lumberjack","Fine")}
{HideCharacter("Lumberjack")}
->HablarFinal
=LenadorConPavo
 Narrador: El leñador se acerca a su familia y los tres abandonan la casa.{IsTalking("John","Fine")}
->HablarFinal
=HablarFinalGranjeroBAD
Narrator: Te acercas al granjero y ve como bajo el brazo tienes a la amada Linda, la mascota familiar.
Hermano Granjero:AJA!Tal y como nos dijo el camionero.{IsTalking("FarmerBrother","Fine")}{IsNotTalking("John","Fine")}
Hermano Granjero:¿Que demonios pensabas hacer con Linda?.
John: Yo solo quería tener algo para cenar.{IsTalking("John","Fine")}{IsNotTalking("FarmerBrother","Fine")}
Hermano Granjero: Pero como te atreves a coger así como así un pavo que no es tuyo.{IsTalking("FarmerBrother","Fine")}{IsNotTalking("John","Fine")}
Narrator: El hermano del Granjero le quita a Linda de los brazos de John y se la lleva, no sin antes coger el otro pavo que te había prometido y llevarselo también.{IsTalking("John","Fine")}
->HablarFinal
=HablarFinalGranjeroGOOD
Hermano Granjero: Buenas John, mi hermano me contó lo que te pasaba asi que aquí estoy.{IsTalking("FarmerBrother","Fine")}{IsNotTalking("John","Fine")}
Hermano Granjero: Le he dado a tu esposa el pavo y unas patatas que teniamos de sobra en la granja.
Hermano Granjero: Espero que las disfruteis . Feliz Navidad!
John: Muchas gracias por todo. Tendré que volver a ver a tu hermano para agradecerselo personalmente.{IsTalking("John","Fine")}{IsNotTalking("FarmerBrother","Fine")}
{HideCharacter("FarmerBrother")}
Narrator: El Granjero sale de la casa.
->HablarFinal


=== Final
*{turkeyStolen}{giftStolen} ->Final_BAD_BAD
*{giftStolen}{not turkeyStolen} -> Final_BAD_GOOD
*{not giftStolen}{turkeyStolen} -> Final_GOOD_BAD
*{not giftStolen}{not turkeyStolen} ->Final_GOOD_GOOD
--> END
===Final_GOOD_GOOD===
Narrador: John se sienta en la mesa junto a su familia y a sus nuevos amigos.
Narrador: John se da cuenta que después de su aventura y de haber vuelto con las manos vacías, habia ganado una nueva amistad.
Narrador: Y ahí se dió cuenta que lo mas importante de la Navidad no es el regalo que entregas o el que recibes o el banquete que te das en la cena.
Narrador: Sino el poder compartirla con gente a la que quieres.
{HideCharacter("Lumberjack")}{HideCharacter("John")}
-> Despedida
===Final_GOOD_BAD===
Narrador: Aunque John no habia sucumbido al robo del regalo, el haber robado ese pavo no le había hecho ninguna gracia a su esposa.{ShowCharacter("John","Center","Fine")}{ShowCharacter("Wife","Right","Fine")}{ShowCharacter("Son","Left","Fine")}
Narrador: Ella decidió que esa noche no quería pasarla con John por lo que había hecho y junto con su hijo se fué a casa de sus padres.{HideCharacter("Wife")}{HideCharacter("Son")}
Narrador: John esa noche pasó la navidad solo y sin nada para comer, tuvo mucho tiempo para reflexionar y darse cuenta que el robar ese pavo no le hizo ningun bien y que aunque no tuviese esa comida, hubiese sido mas feliz rodeado de su familia.{IsNotTalking("John","Fine")}
->Despedida

===Final_BAD_GOOD===
Narrador: John no debía haber tocado ese regalo. A partir de ese momento , su hijo ya no le veía con los mismos ojos.{ShowCharacter("John","Center","Fine")}{ShowCharacter("Wife","Right","Fine")}{ShowCharacter("Son","Left","Fine")}
Narrador: Esa noche su hijo prefirió no cenar y pasar la noche encerrado en el cuarto.{HideCharacter("Son")}
Narrador: La esposa de John no quería perderse el manjar que era el pavo, pero optó por hacerle el vacío a John mientras lo hacía.{IsNotTalking("Wife","Fine")}
Narrador: John habia perdio más que lo que podía haber ganado robando el regalo esa noche. Y se dio cuenta de que la visión de su hijo hacia él como un ladrón no cambiaría.{IsNotTalking("Wife","Fine")}
->Despedida

===Final_BAD_BAD===
Narrador: Pero en que estabas pensando.{ShowCharacter("John","Center","Fine")}
Narrador: ¿Desde cuando robarle a un niño y robar una mascota pueden terminar en buen puerto?
Narrador: John está solo en su casa.{IsNotTalking("John","Fine")}
Narrador: Su mujer y su hijo se han ido a casa de sus padres a pasar el resto de las Navidades. Ninguno de los dos quiere saber nada de John.
Narrador: John se dió cuenta de que lo unico que necesitaba esas Navidades era pasarla con su gente querida alrededor, y que le dió más importancia a un regalo y una cena que a su familia.


->Despedida
=== Final_Congelado ===
{ChangeMood("John", "Serious")}
Narrator: Empiezas a perder el control sobre tus extremidades y poco a poco cierras los ojos hasta no volver a abrirlos. 
Narrator: John murió esperando que la solución viniese ella sola. 
Narrator: No seas como John.
~frozen= true
->Despedida

=== Despedida ===
Narrator: Espero que hayas disfrutado de esta historia.
*{frozen} -> frozenEnd
*{not frozen} ->notFrozenEnd
=frozenEnd
Narrator: Y si eres de esos que se han quedado esperando en el coche, vuelve a intentarlo.
Narrator: ¡Feliz Navidad!#FinalSentence
-->END
=notFrozenEnd
Narrator: Espero que hayais aprendido como John.
Narrator: ¡Feliz Navidad!#FinalSentence
-->END





