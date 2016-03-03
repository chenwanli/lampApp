//
//  DataObject.m
//  蓝牙通讯
//
//  Created by 陈万里 on 15/10/24.
//  Copyright © 2015年 chenwanli. All rights reserved.
//

#import "DataObject.h"

@implementation DataObject
+ (Byte)cwlByte:(NSInteger)byt{
    if (byt == 0) {
        return 0x00;
    }else if (byt == 1){
        return 0x01;
    }else if (byt == 2){
        return 0x02;
    }else if (byt == 3){
        return 0x03;
    }else if (byt == 4){
        return 0x04;
    }else if (byt == 5){
        return 0x05;
    }else if (byt == 6){
        return 0x06;
    }else if (byt == 7){
        return 0x07;
    }else if (byt == 8){
        return 0x08;
    }else if (byt == 9){
        return 0x09;
    }else if (byt == 10){
        return 0x0A;
    }else if (byt == 11){
        return 0x0B;
    }else if (byt == 12){
        return 0x0C;
    }else if (byt == 13){
        return 0x0D;
    }else if (byt == 14){
        return 0x0E;
    }else if (byt == 15){
        return 0x0F;
    }else if (byt == 16){
        return 0x10;
    }else if (byt == 17){
        return 0x11;
    }else if (byt == 18){
        return 0x12;
    }else if (byt == 19){
        return 0x13;
    }else if (byt == 20){
        return 0x14;
    }else if (byt == 21){
        return 0x15;
    }else if (byt == 22){
        return 0x16;
    }else if (byt == 23){
        return 0x17;
    }else if (byt == 24){
        return 0x18;
    }else if (byt == 25){
        return 0x19;
    }else if (byt == 26){
        return 0x1A;
    }else if (byt == 27){
        return 0x1B;
    }else if (byt == 28){
        return 0x1C;
    }else if (byt == 29){
        return 0x1D;
    }else if (byt == 30){
        return 0x1E;
    }else if (byt == 31){
        return 0x1F;
    }else if (byt == 32){
        return 0x20;
    }else if (byt == 33){
        return 0x21;
    }else if (byt == 34){
        return 0x22;
    }else if (byt == 35){
        return 0x23;
    }else if (byt == 36){
        return 0x24;
    }else if (byt == 37){
        return 0x25;
    }else if (byt == 38){
        return 0x26;
    }else if (byt == 39){
        return 0x27;
    }else if (byt == 40){
        return 0x28;
    }else if (byt == 41){
        return 0x29;
    }else if (byt == 42){
        return 0x2A;
    }else if (byt == 43){
        return 0x2B;
    }else if (byt == 44){
        return 0x2C;
    }else if (byt == 45){
        return 0x2D;
    }else if (byt == 46){
        return 0x2E;
    }else if (byt == 47){
        return 0x2F;
    }else if (byt == 48){
        return 0x30;
    }else if (byt == 49){
        return 0x31;
    }else if (byt == 50){
        return 0x32;
    }else if (byt == 51){
        return 0x33;
    }else if (byt == 52){
        return 0x34;
    }else if (byt == 53){
        return 0x35;
    }else if (byt == 54){
        return 0x36;
    }else if (byt == 55){
        return 0x37;
    }else if (byt == 56){
        return 0x38;
    }else if (byt == 57){
        return 0x39;
    }else if (byt == 58){
        return 0x3A;
    }else if (byt == 59){
        return 0x3B;
    }else if (byt == 60){
        return 0x3C;
    }else if (byt == 61){
        return 0x3D;
    }else if (byt == 62){
        return 0x3E;
    }else if (byt == 63){
        return 0x3F;
    }else if (byt == 64){
        return 0x40;
    }else if (byt == 65){
        return 0x41;
    }else if (byt == 66){
        return 0x42;
    }else if (byt == 67){
        return 0x43;
    }else if (byt == 68){
        return 0x44;
    }else if (byt == 69){
        return 0x45;
    }else if (byt == 70){
        return 0x46;
    }else if (byt == 71){
        return 0x47;
    }else if (byt == 72){
        return 0x48;
    }else if (byt == 73){
        return 0x49;
    }else if (byt == 74){
        return 0x4A;
    }else if (byt == 75){
        return 0x4B;
    }else if (byt == 76){
        return 0x4C;
    }else if (byt == 77){
        return 0x4D;
    }else if (byt == 78){
        return 0x4E;
    }else if (byt == 79){
        return 0x4F;
    }else if (byt == 80){
        return 0x50;
    }else if (byt == 81){
        return 0x51;
    }else if (byt == 82){
        return 0x52;
    }else if (byt == 83){
        return 0x53;
    }else if (byt == 84){
        return 0x54;
    }else if (byt == 85){
        return 0x55;
    }else if (byt == 86){
        return 0x56;
    }else if (byt == 87){
        return 0x57;
    }else if (byt == 88){
        return 0x58;
    }else if (byt == 89){
        return 0x59;
    }else if (byt == 90){
        return 0x5A;
    }else if (byt == 91){
        return 0x5B;
    }else if (byt == 92){
        return 0x5C;
    }else if (byt == 93){
        return 0x5D;
    }else if (byt == 94){
        return 0x5E;
    }else if (byt == 95){
        return 0x5F;
    }else if (byt == 96){
        return 0x60;
    }else if (byt == 97){
        return 0x61;
    }else if (byt == 98){
        return 0x62;
    }else if (byt == 99){
        return 0x63;
    }else if (byt == 100){
        return 0x64;
    }else if (byt == 101){
        return 0x65;
    }else if (byt == 102){
        return 0x66;
    }else if (byt == 103){
        return 0x67;
    }else if (byt == 104){
        return 0x68;
    }else if (byt == 105){
        return 0x69;
    }else if (byt == 106){
        return 0x6A;
    }else if (byt == 107){
        return 0x6B;
    }else if (byt == 108){
        return 0x6C;
    }else if (byt == 109){
        return 0x6D;
    }else if (byt == 110){
        return 0x6E;
    }else if (byt == 111){
        return 0x6F;
    }else if (byt == 112){
        return 0x70;
    }else if (byt == 113){
        return 0x71;
    }else if (byt == 114){
        return 0x72;
    }else if (byt == 115){
        return 0x73;
    }else if (byt == 116){
        return 0x74;
    }else if (byt == 117){
        return 0x75;
    }else if (byt == 118){
        return 0x76;
    }else if (byt == 119){
        return 0x77;
    }else if (byt == 120){
        return 0x78;
    }else if (byt == 121){
        return 0x79;
    }else if (byt == 122){
        return 0x7A;
    }else if (byt == 123){
        return 0x7B;
    }else if (byt == 124){
        return 0x7C;
    }else if (byt == 125){
        return 0x7D;
    }else if (byt == 126){
        return 0x7E;
    }else if (byt == 127){
        return 0x7F;
    }else if (byt == 128){
        return 0x80;
    }else if (byt == 129){
        return 0x81;
    }else if (byt == 130){
        return 0x82;
    }else if (byt == 131){
        return 0x83;
    }else if (byt == 132){
        return 0x84;
    }else if (byt == 133){
        return 0x85;
    }else if (byt == 134){
        return 0x86;
    }else if (byt == 135){
        return 0x87;
    }else if (byt == 136){
        return 0x88;
    }else if (byt == 137){
        return 0x89;
    }else if (byt == 138){
        return 0x8A;
    }else if (byt == 139){
        return 0x8B;
    }else if (byt == 140){
        return 0x8C;
    }else if (byt == 141){
        return 0x8D;
    }else if (byt == 142){
        return 0x8E;
    }else if (byt == 143){
        return 0x8F;
    }else if (byt == 144){
        return 0x90;
    }else if (byt == 145){
        return 0x91;
    }else if (byt == 146){
        return 0x92;
    }else if (byt == 147){
        return 0x93;
    }else if (byt == 148){
        return 0x94;
    }else if (byt == 149){
        return 0x95;
    }else if (byt == 150){
        return 0x96;
    }else if (byt == 151){
        return 0x97;
    }else if (byt == 152){
        return 0x98;
    }else if (byt == 153){
        return 0x99;
    }else if (byt == 154){
        return 0x9A;
    }else if (byt == 155){
        return 0x9B;
    }else if (byt == 156){
        return 0x9C;
    }else if (byt == 157){
        return 0x9D;
    }else if (byt == 158){
        return 0x9E;
    }else if (byt == 159){
        return 0x9F;
    }else if (byt == 160){
        return 0xA0;
    }else if (byt == 161){
        return 0xA1;
    }else if (byt == 162){
        return 0xA2;
    }else if (byt == 163){
        return 0xA3;
    }else if (byt == 164){
        return 0xA4;
    }else if (byt == 165){
        return 0xA5;
    }else if (byt == 166){
        return 0xA6;
    }else if (byt == 167){
        return 0xA7;
    }else if (byt == 168){
        return 0xA8;
    }else if (byt == 169){
        return 0xA9;
    }else if (byt == 170){
        return 0xAA;
    }else if (byt == 171){
        return 0xAB;
    }else if (byt == 172){
        return 0xAC;
    }else if (byt == 173){
        return 0xAD;
    }else if (byt == 174){
        return 0xAE;
    }else if (byt == 175){
        return 0xAF;
    }else if (byt == 176){
        return 0xB0;
    }else if (byt == 177){
        return 0xB1;
    }else if (byt == 178){
        return 0xB2;
    }else if (byt == 179){
        return 0xB3;
    }else if (byt == 180){
        return 0xB4;
    }else if (byt == 181){
        return 0xB5;
    }else if (byt == 182){
        return 0xB6;
    }else if (byt == 183){
        return 0xB7;
    }else if (byt == 184){
        return 0xB8;
    }else if (byt == 185){
        return 0xB9;
    }else if (byt == 186){
        return 0xBA;
    }else if (byt == 187){
        return 0xBB;
    }else if (byt == 188){
        return 0xBC;
    }else if (byt == 189){
        return 0xBD;
    }else if (byt == 190){
        return 0xBE;
    }else if (byt == 191){
        return 0xBF;
    }else if (byt == 192){
        return 0xC0;
    }else if (byt == 193){
        return 0xC1;
    }else if (byt == 194){
        return 0xC2;
    }else if (byt == 195){
        return 0xC3;
    }else if (byt == 196){
        return 0xC4;
    }else if (byt == 197){
        return 0xC5;
    }else if (byt == 198){
        return 0xC6;
    }else if (byt == 199){
        return 0xC7;
    }else if (byt == 200){
        return 0xC8;
    }else if (byt == 201){
        return 0xC9;
    }else if (byt == 202){
        return 0xCA;
    }else if (byt == 203){
        return 0xCB;
    }else if (byt == 204){
        return 0xCC;
    }else if (byt == 205){
        return 0xCD;
    }else if (byt == 206){
        return 0xCE;
    }else if (byt == 207){
        return 0xCF;
    }else if (byt == 208){
        return 0xD0;
    }else if (byt == 209){
        return 0xD1;
    }else if (byt == 210){
        return 0xD2;
    }else if (byt == 211){
        return 0xD3;
    }else if (byt == 212){
        return 0xD4;
    }else if (byt == 213){
        return 0xD5;
    }else if (byt == 214){
        return 0xD6;
    }else if (byt == 215){
        return 0xD7;
    }else if (byt == 216){
        return 0xD8;
    }else if (byt == 217){
        return 0xD9;
    }else if (byt == 218){
        return 0xDA;
    }else if (byt == 219){
        return 0xDB;
    }else if (byt == 220){
        return 0xDC;
    }else if (byt == 221){
        return 0xDD;
    }else if (byt == 222){
        return 0xDE;
    }else if (byt == 223){
        return 0xDF;
    }else if (byt == 224){
        return 0xE0;
    }else if (byt == 225){
        return 0xE1;
    }else if (byt == 226){
        return 0xE2;
    }else if (byt == 227){
        return 0xE3;
    }else if (byt == 228){
        return 0xE4;
    }else if (byt == 229){
        return 0xE5;
    }else if (byt == 230){
        return 0xE6;
    }else if (byt == 231){
        return 0xE7;
    }else if (byt == 232){
        return 0xE8;
    }else if (byt == 233){
        return 0xE9;
    }else if (byt == 234){
        return 0xEA;
    }else if (byt == 235){
        return 0xEB;
    }else if (byt == 236){
        return 0xEC;
    }else if (byt == 237){
        return 0xED;
    }else if (byt == 238){
        return 0xEE;
    }else if (byt == 239){
        return 0xEF;
    }else if (byt == 240){
        return 0xF0;
    }else if (byt == 241){
        return 0xF1;
    }else if (byt == 242){
        return 0xF2;
    }else if (byt == 243){
        return 0xF3;
    }else if (byt == 244){
        return 0xF4;
    }else if (byt == 245){
        return 0xF5;
    }else if (byt == 246){
        return 0xF6;
    }else if (byt == 247){
        return 0xF7;
    }else if (byt == 248){
        return 0xF8;
    }else if (byt == 249){
        return 0xF9;
    }else if (byt == 250){
        return 0xFA;
    }else if (byt == 251){
        return 0xFB;
    }else if (byt == 252){
        return 0xFC;
    }else if (byt == 253){
        return 0xFD;
    }else if (byt == 254){
        return 0xFE;
    }else{
        return 0xFF;
    }
}

#pragma mark - 协议1
- (NSData *)agreementA{
    Byte ucaCmdData[8];
    ucaCmdData[0] = 0xCC;//帧头
    ucaCmdData[1] = 0x76;//帧头
    ucaCmdData[2] = 0x06;//crc前字节长度
    ucaCmdData[3] = 0x01;//命令
    ucaCmdData[4] = 0x00;//保留位
    ucaCmdData[5] = 0x00;//保留位

    UInt16 creatCRC = [self creatCRClpPack:ucaCmdData packLen:6];
    
    ucaCmdData[6] = (Byte)(creatCRC >> 8);
    ucaCmdData[7] = (Byte)(creatCRC >> 0);

    NSData *data =[[NSData alloc] initWithBytes:ucaCmdData length:8];
    return data;
}

- (NSData *)protocolErData:(UInt16)keyData operationData:(Byte *)operationData pwsByte:(Byte *)pwsByte{
    Byte ucaCmdData[18];
    ucaCmdData[0] = 0xCC;//帧头
    ucaCmdData[1] = 0x76;//帧头
    ucaCmdData[2] = 0x10;//crc前字节长度
    ucaCmdData[3] = 0x03;//命令
    
    
    Byte pwsDataByte[4];
    bdAddrLow2Str(pwsByte,pwsDataByte,2);
    
    Byte cipherText[12];
    cipherText[0] = pwsDataByte[0];//密码1
    cipherText[1] = pwsDataByte[1];//密码2
    cipherText[2] = pwsDataByte[2];//密码3
    cipherText[3] = pwsDataByte[3];//密码4

    cipherText[4] = operationData[0];//数据1
    cipherText[5] = operationData[1];//数据2
    cipherText[6] = operationData[2];//数据3
    cipherText[7] = operationData[3];//数据4
    cipherText[8] = operationData[4];//数据5
    cipherText[9] = operationData[5];//数据6
    cipherText[10] = operationData[6];//数据7
    cipherText[11] = operationData[7];//数据8
    
    UInt8 express[12];
    decryptDat(keyData,cipherText,express,12);

    ucaCmdData[4] = express[0];//密码1
    ucaCmdData[5] = express[1];//密码2
    ucaCmdData[6] = express[2];//密码3
    ucaCmdData[7] = express[3];//密码4
    
    ucaCmdData[8] = express[4];//数据1
    ucaCmdData[9] = express[5];//数据2
    ucaCmdData[10] = express[6];//数据3
    ucaCmdData[11] = express[7];//数据4
    
    ucaCmdData[12] = express[8];//数据5
    ucaCmdData[13] = express[9];//数据6
    ucaCmdData[14] = express[10];//数据6
    ucaCmdData[15] = express[11];//数据6

    UInt16 creatCRC = [self creatCRClpPack:ucaCmdData packLen:16];
    ucaCmdData[16] = (Byte)(creatCRC >> 8);
    ucaCmdData[17] = (Byte)(creatCRC >> 0);

    NSData *data =[[NSData alloc] initWithBytes:ucaCmdData length:18];

    NSLog(@"数据－－－－－%@",data);
    return data;
}


#pragma mark - CRC
- (UInt16)creatCRClpPack:(UInt8 *)lpPack packLen:(UInt16)packLen{
    UInt16 chkSum, i;
    chkSum = 0;
    for(i = 0; i < packLen; i++)		//注意:由于特别需要，所以是第一个字节不参于校验
        chkSum = (chkSum << 8) ^ crctab[(chkSum >> 8) ^ lpPack[i]];
    return chkSum;
}


#pragma mark - 密码
static void bdAddrLow2Str( UInt8 *pAddrLow, UInt8 *express, UInt8 length )
{
    UInt8  i;
    char hex[] = "0123456789ABCDEF";
    for ( i = 0; i < length; i++ )
    {
        *express++ = hex[pAddrLow[i] >> 4];
        *express++  = hex[pAddrLow[i] & 0x0F];
    }
}

#pragma mark - 加密
/*
 keyData 密码
 cipherText 加密内容
 length 内容长度
 */
static void decryptDat( UInt16 keyData, UInt8 *cipherText, UInt8 *express, UInt8 length )
{
    UInt8  i, b1, b2, fristByte;
    
    fristByte = cipherText[0];
    b1 = fristByte <<4;
    
    for (i = 1; i < length; i++){
        b2 = cipherText[i];
        
//        NSLog(@"加密   %hu",keyData);
        if( i % 2 ){
            express[i] = ( b1 | ( ( b2 >> 4 ) & 0x0f) ) ^ base_tab[ keyData % 0x100 ];
        }
        else{
            express[i] = ( b1 | ( ( b2 >> 4 ) & 0x0f) ) ^ base_tab[ keyData / 0x100 ];
        }
        b1 = b2 << 4;
    }
    express[0] = ( b1 | ( ( fristByte >> 4 ) & 0x0f ) ) ^ base_tab[ keyData / 0x100 ];
}




const UInt16 crctab[256] = {0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
    0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
    0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
    0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
    0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
    0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
    0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
    0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
    0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
    0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
    0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
    0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
    0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
    0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
    0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
    0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
    0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
    0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
    0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
    0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
    0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
    0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
    0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
    0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
    0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
    0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
    0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
    0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
    0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
    0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
    0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0};

const UInt8 base_tab[]= { 0xF6, 0x20, 0x12, 0x8E, 0xE2, 0x7F, 0x23, 0x30,
    0x94, 0x52, 0xD2, 0x99, 0x5E, 0xF8, 0x35, 0x51,
    0xA3, 0xA6, 0xDE, 0x18, 0xC2, 0x5F, 0xE7, 0x1F,
    0xA8, 0xD8, 0x7B, 0x79, 0x53, 0x5C, 0xD9, 0x49,
    0x92, 0x40, 0x80, 0x50, 0x27, 0xAE, 0x72, 0xF0,
    0xB1, 0xAF, 0x0C, 0xEC, 0xCF, 0x9C, 0x19, 0xC0,
    0xB9, 0xCA, 0xF2, 0xCD, 0x14, 0x34, 0x2B, 0x6E,
    0x39, 0x4A, 0xB5, 0x1A, 0xFF, 0x75, 0x66, 0xF4,
    0xD0, 0x7E, 0x2F, 0x11, 0xB0, 0xDB, 0x32, 0x3B,
    0xBF, 0xBA, 0x88, 0x6A, 0x0B, 0x5D, 0x55, 0xEE,
    0x08, 0x28, 0x3A, 0x96, 0x97, 0x36, 0x24, 0x67,
    0x4C, 0x9D, 0x10, 0x4F, 0x3C, 0x60, 0x8B, 0xFB,
    0x5A, 0x76, 0x0A, 0xDF, 0x74, 0x70, 0x8F, 0xED,
    0x7A, 0x43, 0x06, 0x1E, 0x05, 0x9A, 0x58, 0x6F,
    0x8D, 0x3F, 0x2D, 0xF7, 0xBC, 0x9B, 0x95, 0xFE,
    0x42, 0x64, 0x31, 0x01, 0x62, 0x46, 0xCE, 0x02,
    0x89, 0x6B, 0x3E, 0xC4, 0xB6, 0xEA, 0x61, 0x91,
    0xF9, 0x38, 0xAB, 0x0D, 0x00, 0x2A, 0x45, 0xAA,
    0x29, 0xA5, 0x8C, 0xDC, 0x9F, 0x6D, 0x4B, 0xA7,
    0x7C, 0x59, 0xB7, 0xA0, 0x03, 0xFD, 0x78, 0xC6,
    0xFA, 0xCB, 0xAC, 0x47, 0xD5, 0x22, 0x83, 0xD4,
    0xC1, 0x69, 0xC9, 0x13, 0xC5, 0x86, 0xF3, 0xBE,
    0x15, 0xA4, 0x68, 0x04, 0x56, 0x98, 0xE0, 0x54,
    0x6C, 0x1D, 0xFC, 0xBD, 0x87, 0xB4, 0x2E, 0x21,
    0x07, 0x48, 0xD1, 0x1B, 0xF5, 0x09, 0x7D, 0x25,
    0x8A, 0x9E, 0xB8, 0x71, 0x17, 0xC7, 0xE3, 0x84,
    0x93, 0x90, 0xD7, 0xE1, 0xDA, 0xAD, 0x73, 0x16,
    0xE5, 0x41, 0x65, 0xDD, 0x26, 0x57, 0xE4, 0x1C,
    0x85, 0xEF, 0x0E, 0x4D, 0x37, 0xD3, 0xC8, 0xBB,
    0xCC, 0xA2, 0x81, 0x0F, 0xA9, 0xEB, 0xE6, 0x4E,
    0x63, 0x77, 0xD6, 0x3D, 0x44, 0xC3, 0x82, 0xF1,
    0xE8, 0xB2, 0xA1, 0xB3, 0x5B, 0x2C, 0x33, 0xE9};
@end
