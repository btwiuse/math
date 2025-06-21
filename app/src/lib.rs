#![no_std]

use sails_rs::prelude::*;

mod math;

struct MathService(());

#[sails_rs::service]
impl MathService {
    pub fn new() -> Self {
        Self(())
    }

    pub fn sqrt(&mut self, y: U256) -> U256 {
        math::sqrt(y)
    }

    pub fn min(&mut self, x: U256, y: U256) -> U256 {
        math::min(x, y)
    }
}

pub struct MathProgram(());

#[sails_rs::program]
impl MathProgram {
    // Program's constructor
    pub fn new() -> Self {
        Self(())
    }

    // Exposed service
    pub fn math(&self) -> MathService {
        MathService::new()
    }
}
