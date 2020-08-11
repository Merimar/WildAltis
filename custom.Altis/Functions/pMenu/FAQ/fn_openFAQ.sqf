disableSerialization;
if(isNull findDisplay 3950) then {createDialog "FAQ";};

private _display = findDisplay 3950;
private _questionList = _display displayCtrl 3951;
private _questions = [
["Was ist der legale Chop Shop?","Ein Händler bei dem legale Fahrzeuge verkauft werden können, bevor du das jedoch machst wäre es sinnvoll dem Besitzer die Chance zu geben das Fahrzeug zurück zu kaufen. Dies ist jedoch keine Pflicht würde aber das RP fördern."], 
["Was ist der illegale Chop Shop?","Ein Händler bei dem illegale Fahrzeuge verkauft werden können, bevor du das jedoch machst wäre es sinnvoll dem Besitzer die Chance zu geben das Fahrzeug zurück zu kaufen. Dies ist jedoch keine Pflicht würde aber das RP fördern."], 
["Was ist der Schrottplatz?","Ein Händler bei dem es möglich ist sein zerstörtes Fahrzeug, welches nicht versichert war, zu 90% seinen Kaufpreises zurückzukaufen."],
["Was ist der Abstellhof?","Ein Ort bei dem deine von der Polizei beschlagnahmten Fahrzeuge verwahrt werden. Um dein Fahrzeug zurück zu bekommen musst du es für 20% vom Kaufpreis zurückkaufen."],
["Was sind DP-Missionen?","Eine Liefermission bei allen DP 1-25 angenommen werden. Nach Annahme erhält man den Auftrag ein Paket zu einem zufällig ausgewählten DP zu liefern (man erhält nicht wirklich ein Paket, nur den Auftrag in Textform)."], 
["Was bringt mir eine Versicherung?","Nach dem abschließen einer Versicherung im Wert von 70% des Kaufpreises behältst du dein Fahr- oder Flugzeug sollte es durch einen Unfall explodieren oder von anderen Spielern verkauft werden. (Flugzeuge oder Boote können nicht von Spielern verkauft werden.)"], 
["Ist es erlaubt Spieler zu überfahren?","Nein, es handelt sich hierbei um VDM (VehicleDeathMatch) und kann im schlimmsten Fall durch einen Bann im Support geahndet werden."], 
["Ist es erlaubt Spieler ohne ein 'Call' zu erschießen?","Nein, es handelt sich hierbei um RDM (RandomDeathMatch) und wird im Support mit einem Bann geahndet."], 
["Wo sehe ich die Farmrouten?","Im Z-Inventar im Reiter Farmrouten werden alle Farmrouten genau erklärt."], 
["Wie kann ich mich heilen?","In dem du dir im Markt einen Erstehilfekasten kaufst und durch Scrollen mit dem Mausrad 'Selbstbehandeln' auswählst. Du kannst dich erst selber Heilen sobald du unter der Stufe bist die du Heilen kannst. Zum Beispiel: Du kannst bis auf Stufe 75 Heilen das bedeutet du kannst dich erst ab Stufe 74 Heilen."], 
["Wie zeige ich meinen Ausweis?","Du kannst deinen Ausweis über den Button Ausweis im Z-Inventar zeigen. Alle Spieler im Umkreis von 5 Metern können dann deinen Ausweis sehen."], 
["Wie erkenne ich Polizisten?","Polizisten sind immer in Polizeifahrzeugen unterwegs die klar erkenntlich sind und haben darüber hinaus eigene Polizei-Skins und ein Barett auf. Über ihrem Ingame-Namen steht ihr Polizeirang in Blau."], 
["Wie erkenne ich Feuerwehrler?","Feuerwehrler sind immer in Feuerwehrfahrzeugen unterwegs die klar erkenntlich sind und haben darüber hinaus eigene Feuerwehr-Skins und ein Barett auf. Über ihrem Ingame Namen steht ihr Feuerwehrrang."], 
["Wie lautet die TS3 IP?","ts.wild-altis.de"],
["Wie komme ich auf das Forum?","https://wild-altis.de/forum/"], 
["Was ist der Halo Jump?","Für 100k kannst du an bestimmten Schildern überall auf der Map abspringen und mit einem Fallschirm, der sich automatisch bei 150 Metern öffnet, landen. Der Halo Jump kann nur 5 mal pro Server-Restart benutzt werden."], 
["Was ist die U-Bahn?","Mit der U-Bahn kannst du von einer Stadt zu einer anderen Stadt für einen kleinen Geldbetrag schnell reisen."], 
["Was ist eine Safezone?","Ein Bereich bei dem keine Überfälle getätigt werden dürfen. Nicht markierte Safezones sind ATM´s, Fahr und Flugzeugshops, Garagen und Krankenhäuser im Umkreis von 100m."], 
["Was ist der Gangfight?","Ein Bereich bei dem sich die Gang´s, die sich angemeldet haben, nach ablauf eines Timers, für 10 Minuten bekämpfen und um zu Gewinnen eine Flagge im inneren des Ghosthotels einnehmen müssen."], 
["Wie melde ich mich zum Gangfight an?","10 Minuten nach jedem Serverrestart haben die Gangs 10 Minuten zeit sich für den Gangfight anzumelden."], 
["Wann sind die Serverrestarts?","13 Uhr/17 Uhr/21 Uhr/01 Uhr"], 
["Was bekommt der Gewinner des Gangfights?","Die Gewinner-Gang bekommt einen zufälligen Gangbuff und die Fahrzeuge der Gang können für diese Serverperiode nicht von anderen Spielern verkauft werden."], 
["Was bringt mir eine Garage?","Einen weiteren Spawnpunkt und einen Ort bei dem du deine Fahrzeuge ausparken kannst."], 
["Was passiert wenn ich ins Gefängnis komme?","Du sitzt dort deine Zeit ab oder sammelst Steine um in den Hof zu kommen wo du durch deine Kollegen befreit werden kannst. Du verlierst deine Rebellenlizenz solltest du eine besitzen wenn du nicht befreit wirst."], 
["Wo kann ich Spenden?"," Du kannst im Forum spenden."], 
["Was bringt es mir zu Spenden?","Du unterstützt den Server mit deiner Spende und bekommst darüber hinaus auf dem Server ein Premiumlevel, über die vorteile eines Premiumlevel´s kannst du dich im Forum informieren."], 
["Was bringt mir dass Schließfach?","Im Schließfach kannst du deine Waffen/Kleidung/Items verstauen und jederzeit wieder auslagern."], 
["Was ist die Unbekannte Struktur?","Eine PvP zone bei der 4 Kisten Spawnen, in denen sich Waffen und Aufsätze im Wert von 3-5 Millionen befinden. Desweiteren ist es möglich getötete Spieler zu looten."], 
["Was ist der Defibrillator?","Ein Item mit dem es dir möglich ist deine Kollegen wiederzubeleben."], 
["Was ist die Adrenalinspritze?","Solltest du durch einen Unfall sterben kannst du dich durch eine Adrenalinspritze wiederbeleben, dies ist jedoch nicht möglich solltest du durch einen anderen Spieler getötet werden."], 
["Was ist ein Pflichtticket?","Ein Ticket das dir die Polizei austellen kann welches du bezahlen musst. Das Ticket wird nur bei schweren Verbrechen ausgestellt, meistens auch in Verbindung mit dem Gefängnis."], 
["Was ist ein Prozentticket?","Ein Ticket das dir die Polizei austellen kann welches einen Prozentsatz von deinem Konto abzieht (maximal 5%). Wird nur bei schweren Verbrechen ausgestellt meistens auch in Verbindung mit dem Gefängnis."], 
["Wie interagiere ich mit einem ATM?","Du kannst über die Windowstaste auf den ATM zugreifen."], 
["Wie funktioniert die Zentralbank?","Damit die Zentralbank ausgeraubt werden kann müssen 15 Polizisten online sein. Um die Bank aufbrechen zu können benötigen die Räuber einen Bolzenschneider und eine Sprengladung. Bevor die Sprengladung am Tresor angebracht werden darf müssen jedoch Verhandlungen mit der Polizei geführt werden, erst nach dem scheitern der Verhandlungen darf am Tresor angebracht werden. Da sich wie üblich im Tresor kein Gold befindet, sondern ein Skorpionsgift, ist es notwendig, dass die Bankräuber mit bestimmten Fahrzeugen kommen um das Gift auch auslagern zu können, die im Rebellenshop als 'Zentralbank Fahrzeug' gekennzeichnet sind. Mit dem erbeuteten Gift müssen die Räuber zu einem von zwei Giftankäufern und dort alles Verkaufen."],  
["Wie rufe ich die Polizei oder Feuerwehr?","In dem ich über das Z-Inventar den Messanger auswähle und dort eine Nachricht an die Polizei/Feuerwehr schreibe, wobei ich auch meinen aktuellen Standort angeben kann."], 
["Was ist die Deutsche Bank und das Privatanwesen?","Es sind kleine Banken die ausgeraubt werden dürfen, sobald 10 Polizisten online sind. Es können hierbei beträge im Wert von 1-2 Millionen erbeutet werden."], 
["Wie viele Member dürfen maximal in einer Gang sein?","Es dürfen maximal 15 in einer Gang und 12 online sein"], 
["Was sind Gangbuffs?","Vorteile die durch das Gewinnen der Gangeroberung erlangt werden können."], 
["Welche Gangbuffs gibt es?","Farm-Boost, XP-Boost, Heilen auf 100, Verbesserter Gangshop, Ausdauer-Boost, Gangdealer"], 
["Was ist das Skillsystem?","Es zeigt eure Fortschritte im Skillsystem welches du im Z-Inventar einsehen kannst."], 
["Wie löse ich meinen Supportcode ein?","Du kannst deinen Supportcode im ATM einlösen."], 
["Was sind Supportcodes?","Codes die dir Supporter geben um dir Geld zurück zu erstatten, welches du durch Bugs oder Regelbrüche anderer Spieler verloren hast. Weswegen es sich immer lohnt eine Aufnahme laufen zu lassen."], 
["Was bringt mir die Rebellenlizenz?","Die Möglichkeit sich im Opfor-Slot einzuloggen und dir dadurch am Rebellen-Außenposten oder Rebellen-City bessere Waffen, Ausrüstung und gepanzerte Fahr- und Flugzeuge zu kaufen."], 
["Was ist der Lackierer?","Ein Händler bei dem du deine Fahrzeuge mit besonderen Folien ausstatten kannst, solltest du über ein Premiumlevel verfügen."], 
["Was ist ein Dietrich?","Ein Item mit dem du Fahrzeuge von anderen Spielern aufknacken und stehlen kannst oder einen gefesselten Spieler befreien kannst."], 
["Wie kann ich mich bei der Polizei oder Feuerwehr bewerben?","In dem du dich auf dem TS3 ts.wild-altis.de einfindest und dich im jeweiligen Bewerbungsbereich erkundigst."], 
["Wo kann ich mich über Regelbrüche beschweren?","Auf dem Teamspeak im Wartebereich Support."], 
["Wie schlage ich eine Person nieder?","Mit der Tastenkombination 'Shift+G'."], 
["Wie ergebe ich mich?","Mit der Tastenkombination 'Shift+J'."], 
["Wie schließe ich mein Auto ab?","Mit der Taste 'U'."], 
["Wie benutze ich Ohrenstöpsel?","Mit der Tastenkombination 'Shift+U'."], 
["Wie benutze ich Wild-Energy","Du kannst Wild-Energy entweder durch das Z-Inventar benutzen oder durch ALT GR auf deiner Tastatur."], 
["Wie kann ich die Spielernamen von Spielern in meiner Umgebung anzeigen lassen?","Mit der Taste Zirkumflex auf deiner Tastatur. (Ist neben der 1 über Tab)"], 
["Was ist ein Ganghaus?","Ein Haus welches für die Gang gekauft wird. Sollte die Gang aufgelöst werden wird auch das Haus gelöscht. Das Ganghaus ist ein weiterer Spawnpunkt für alle Gangmember. Im Ganghaus können diverse Upgrades gekauft werden."], 
["Mit welcher Taste kann ich als Polizist Schranken von innerhalb eines Fahrzeuges öffnen?","Mit der Taste Q auf deiner Tastatur."], 
["Mit welcher Taste komme ich in den Kofferraum meines Autos?","Mit der Taste T auf deiner Tastaur."], 
["Wie kann ich einen Spieler festnehmen?"," Mit der Tastenkombination 'Shift + R'."], 
["Was ist eine Sperrzone?","Ein Bereich der von der Polizei für eine nicht bestimmte Zeit zum Sperrgebiet gemacht wird, durch betreten der Zone besteht die Chance von Polizeilichen Maßnahmen betroffen zu werden z.B Festnahmen, Beschuss."]
];

{
private _question = _x select 0;
private _answer = _x select 1;

_questionList lbAdd _question;
_questionList lbSetData [(lbSize _questionList)-1, _answer];
}forEach _questions;