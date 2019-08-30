import time
import random
import atexit
import json


def a_last_good_bye():
    print('Adios my friend !')
    exit(0)


atexit.register(a_last_good_bye)

dragon_names = [
    'Xaymmynth, Champion Of The Blue',
    'Chynnyrth, Champion Of Men',
    'Orro, The Clean',
    'Xarsot, The Tyrant',
    'Gara, The Magnificent',
    'Jyrgieg, The Swift',
    'Urri, The Life Giver',
    'Qandocruss, Champion Of The White',
    'Xedroneg, Champion Of The Red',
    'Devorrat, The Champion',
    'Vugeo, The Youngling',
    'Gazzess, The Tender',
    'Talrayd, The Hungry',
    'Teiraes, The Dark One',
    'Freta, The Evil One',
    'Ievio, Bringer Of Death',
    'Gairvol, The Puny',
    'Saymmiarroith, The Youngling',
    'Ceogurrayss, The Mysterious One',
    'Zyvrieliar, The Swift',
    'Zaellyt, The Gifted One',
    'Xughus, The Tall',
    'Frarvurth, The Voiceless',
    'Yndray, Lord Of The Yellow',
    'Xaerlulth, The Warm',
    'Cedhayd, Champion Of Dragons',
    'Frurunth, Firebreath',
    'Siovaeloi, Protector Of The Weak',
    'Gorsolun, Warmheart',
    'Poarluntaynth, The Voiceless One',
]


def main():
    while True:
        print(json.dumps({'name': dragon_names[random.randint(0, len(dragon_names) - 1)]}))
        time.sleep(1)


if __name__ == '__main__':
    main()
