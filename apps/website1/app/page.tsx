"use client";

import { MyComp } from "@repo/ui/src/features/base-components/test";
import { useState } from "react";

export default function Page() {
        return (
                <div className="p-4 space-y-4">
                        <div className="bg-lime-500 p-2 rounded">This uses local tailwind className in next app</div>
                        <MyComp />
                </div>
        );
}