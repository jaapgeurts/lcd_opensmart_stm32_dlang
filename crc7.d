module crc7;

// generate this table with CTFE
// make this table static
static CRCTable =  GenerateCRCTable();

ubyte[256] GenerateCRCTable()
{
  ubyte[256] table;
  int i, j;
  ubyte CRCPoly = 0x89;  // the value of our CRC-7 polynomial

  // generate a table value for all 256 possible byte values
  for (i = 0; i < 256; ++i) {
    table[i] = cast(ubyte)((i & 0x80) ? i ^ CRCPoly : i);
    for (j = 1; j < 8; ++j) {
        table[i] <<= 1;
        if (table[i] & 0x80)
            table[i] ^= CRCPoly;
    }
  }
  return table;
}

ubyte CRCAdd(ubyte CRC, ubyte message_byte)
{
    return CRCTable[(CRC << 1) ^ message_byte];
}

// returns the CRC-7 for a message of "length" bytes
ubyte getCRC(ubyte[] message)
{
  int i;
  ubyte CRC = 0;

  for (i = 0; i < message.length; ++i)
    CRC = CRCAdd(CRC, message[i]);

  return CRC;
}

unittest {
  assert((getCRC([0x40,0x00,0x00,0x00,0x00])<<1 | 1) == 0x95,"CRC1 failed");
  assert((getCRC([0x48,0x00,0x00,0x01,0xAA])<<1 | 1) == 0x87,"CRC2 failed");
}
