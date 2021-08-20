import 'package:get/get.dart';

class LocaleString extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {

    //ENGLISH LANGUAGE
    'en_US': {
    'hello': 'Hello World',
    'videoV': 'VideoPlayer View',
    'notiV': 'Open Notification View',
    'openP': 'Open Pictures View',
    'videoN': 'Video Player From Network',
    'videoF': 'Video Player From File',
    },

    //FRENCH LANGUAGE
    'fr_FR': {
      'hello': 'Bonjour le monde',
      'videoV': 'Vue du lecteur vidéo',
      'notiV': 'Ouvrir la vue des notifications',
      'openP': 'Ouvrir la vue des images',
      'videoN': 'Lecteur vidéo à partir du réseau',
      'videoF': 'Lecteur vidéo à partir dun fichier ',
    },

    //GERMAN LANGUAGE
    'ge_GE': {
      'hello': 'Hallo Welt',
      'videoV': 'VideoPlayer-Ansicht',
      'notiV': 'Benachrichtigungsansicht öffnen',
      'openP': 'Bilderansicht öffnen',
      'videoN': 'Videoplayer vom Netzwerk',
      'videoF': 'Videoplayer aus Datei ',
    },

    //SPANISH LANGUAGE
    'es_ES': {
      'hello': 'Hola Mundo',
      'videoV': 'Vista de VideoPlayer',
      'notiV': 'Abrir vista de notificaciones',
      'openP': 'Abrir vista de imágenes',
      'videoN': 'Reproductor de video desde la red',
      'videoF': 'Reproductor de video desde archivo',
    }

  };


}
