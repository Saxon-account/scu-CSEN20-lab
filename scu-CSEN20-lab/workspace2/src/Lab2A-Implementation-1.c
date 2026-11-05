#include <stdint.h>

// Saxon Meznarich 10/1/2026
//  Lab 2A 8-Bit Binary Numbers: This program includes 4 functions for converting between
//  an 8-bit array to unsigned and signed 8-bit integers, and incrementing bits.

// Converts an array of bits to an unsigned 8-bit integer
uint32_t Bits2Unsigned(int8_t bits[8])
{
    // To be implemented by student
    // Input:   bits[0] = Least significant bit
    //          bits[7] = Most significant bit
    // Output:  0 <= return value < 255
    uint32_t value;
    int bit;

    // Implementation
    value = 0;
    for (int i = 7; i >= 0; i--)
    {
		bit = bits[i];
        value = value * 2 + bit;
    }

    return value;
}

// Converts an array of bits to a signed 8-bit integer
int32_t Bits2Signed(int8_t bits[8])
{
    // To be implemented by student
    // Input:   bits[0] = Least significant bit
    //          bits[7] = Most significant bit
    // Output: -128 <= return value <= +127
    int32_t value;

    // Implementation
    value = 0;
    for (int i = 6; i >= 0; i--)
    {
        value = value * 2 + bits[i];
    }
    if (bits[7] == 1)
    {
        value += -128;
    }

    return value;
}

// Increments the unsigned 8-bit integer represented by an array of bits by 1
void Increment(int8_t bits[8])
{
    // To be implemented by student
    // Adds 1 to the number represented by bits
    // Where:   bits[0] = Least significant bit
    //          bits[7] = Most significant bit
    int32_t bit, carry, sum;
    carry = 1;

    // Implementation
    for (int i = 0; i <=7; i++)
    {
		bit = bits[i];
        sum = bit + carry;
        bits[i] = sum % 2;
        carry = sum / 2;
    }

    return;
}

// Converts an unsigned 8-bit integer to an array of bits
void Unsigned2Bits(uint32_t n, int8_t bits[8])
{
    // To be implemented by student
    // Input:   0 <= n <= 255
    // Output:  Converts n to an array of bits
    // Where:   bits[0] = Least significant bit
    //          bits[7] = Most significant bit
    int32_t bit;

    // Implementation

    for (int i = 0; i <= 7; i++)
    {
        if (n % 2 == 0)
        {
            bit = 0;
        }
        else
        {
            bit = 1;
        }
        bits[i] = bit;
        n = n / 2;
    }

    return;
}
