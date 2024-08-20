#
# Copyright (C) 2023 The risingOS Android Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_SOONG_NAMESPACES += \
    vendor/lineage/prebuilts

PRODUCT_COPY_FILES += \
    vendor/lineage/bootanimation/prebuilts/bootanimation_cm.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_cm.zip \
    vendor/lineage/bootanimation/prebuilts/bootanimation_cyberpunk.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_cyberpunk.zip \
    vendor/lineage/bootanimation/prebuilts/bootanimation_evo_anniv.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_evo_anniv.zip \
    vendor/lineage/bootanimation/prebuilts/bootanimation_google.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_google.zip \
    vendor/lineage/bootanimation/prebuilts/bootanimation_google_monet.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_google_monet.zip \
    vendor/lineage/bootanimation/prebuilts/bootanimation_rr.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_rr.zip \
    vendor/lineage/bootanimation/prebuilts/bootanimation_valorant.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_valorant.zip
