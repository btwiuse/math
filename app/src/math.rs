use sails_rs::prelude::U256;

/// Returns the minimum of two U256 values.
pub fn min(x: U256, y: U256) -> U256 {
    if x < y { x } else { y }
}

/// Computes the integer square root using the Babylonian method.
pub fn sqrt(y: U256) -> U256 {
    if y > U256::from(3u8) {
        let mut z = y;
        let mut x = (y >> 1) + U256::one();
        while x < z {
            z = x;
            x = ((y / x) + x) >> 1;
        }
        z
    } else if y != U256::zero() {
        U256::one()
    } else {
        U256::zero()
    }
}
